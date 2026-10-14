#!/usr/bin/env bash
# Graywing Ag Systems - Gemini Enterprise lab setup. Run in Cloud Shell of a fresh Qwiklabs project.
# Steps: project -> APIs -> Gemini Enterprise app + Google Drive connector -> Drive access check ->
# copy the demo data into your My Drive (emails and calendars are simulated as files there) -> print your links.
# Safe to re-run: every step reuses earlier work.
# Everything is logged with timestamps to ~/graywing-lab/setup.log.
set -uo pipefail

# ---- settings -------------------------------------------------------------------------------------------
DATA_URL="${DATA_URL:-https://raw.githubusercontent.com/imlakshayd/graywing-ge-lab/main/graywing-demo-data.zip}"          # gs://... or https://... zip of "Graywing Ag Systems (Demo Data)"
LOCATION="${GE_LOCATION:-global}"            # Gemini Enterprise location: global | us | eu
APP_ID="${APP_ID:-graywing-ag-systems}"
APP_NAME="${APP_NAME:-Graywing Ag Systems}"
COMPANY="${COMPANY:-Graywing Ag Systems}"
DRIVE_STORE_ID="${DRIVE_STORE_ID:-graywing-drive}"
WORK="${WORK:-$HOME/graywing-lab}"
# ---------------------------------------------------------------------------------------------------------

mkdir -p "$WORK" || { echo "Can't create $WORK"; exit 1; }
LOG="$WORK/setup.log"
STEPS=6
STEP=0
T0=$SECONDS

ts() { date '+%H:%M:%S'; }
elapsed() { local s=$(( SECONDS - T0 )); printf '%d:%02d' $(( s / 60 )) $(( s % 60 )); }
log() { printf '%s  %s\n' "$(ts)" "$*" >> "$LOG"; }
step() {
  STEP=$(( STEP + 1 ))
  printf '\n\033[1;36m[%d/%d]\033[0m \033[1m%s\033[0m  \033[2m(%s elapsed)\033[0m\n' "$STEP" "$STEPS" "$*" "$(elapsed)"
  log "== STEP $STEP/$STEPS: $*"
}
ok() { printf '      \033[32m✔\033[0m %s\n' "$*"; log "OK    $*"; }
info() { printf '        %s\n' "$*"; log "      $*"; }
warn() { printf '      \033[33m!\033[0m %s\n' "$*"; log "WARN  $*"; }
die() {
  printf '\r\033[K\n      \033[31m✘ %s\033[0m\n\n' "$*"
  printf '      Stopped at step %d of %d after %s. Full log: %s\n' "$STEP" "$STEPS" "$(elapsed)" "$LOG"
  printf '      Fix the problem above (or just wait a minute), then paste the script again; it picks up where it left off.\n\n'
  log "FAIL  $*"
  exit 1
}
# spin "message" command...  -> runs the command with a live spinner + seconds counter; output goes to the log
spin() {
  local msg="$1"; shift
  log "RUN   $*"
  "$@" >> "$LOG" 2>&1 &
  local pid=$! i=0 start=$SECONDS frames=('|' '/' '-' '\')
  while kill -0 "$pid" 2>/dev/null; do
    printf '\r      \033[36m%s\033[0m %s \033[2m%ss\033[0m ' "${frames[i++ % 4]}" "$msg" $(( SECONDS - start ))
    sleep 0.2
  done
  wait "$pid"; local rc=$?
  printf '\r\033[K'
  return $rc
}

case "$LOCATION" in
  global) HOST="https://discoveryengine.googleapis.com" ;;
  *) HOST="https://${LOCATION}-discoveryengine.googleapis.com" ;;
esac

printf '\n\033[1m  Graywing Ag Systems · Gemini Enterprise lab setup\033[0m\n'
printf '  \033[2mTakes about 5 minutes. Progress is shown below; the full log is in %s\033[0m\n' "$LOG"
log "######## setup started (DATA_URL=$DATA_URL LOCATION=$LOCATION APP_ID=$APP_ID)"

# ---- 1. project and account ------------------------------------------------------------------------------
step "Checking your lab project and sign-in"
PROJECT="${GOOGLE_CLOUD_PROJECT:-$(gcloud config get-value project 2>/dev/null)}"
if [ -z "$PROJECT" ] || [ "$PROJECT" = "(unset)" ]; then
  PROJECT="$(gcloud projects list --format='value(projectId)' --filter='projectId:qwiklabs-gcp-*' --limit=1 2>/dev/null)"
fi
[ -n "$PROJECT" ] || die "No project found. In the console, pick the lab project at the top, then paste the script again."
gcloud config set project "$PROJECT" >> "$LOG" 2>&1
ACCOUNT="$(gcloud config get-value account 2>/dev/null)"
PROJECT_NUMBER="$(gcloud projects describe "$PROJECT" --format='value(projectNumber)' 2>>"$LOG")"
[ -n "$PROJECT_NUMBER" ] || die "Can't read project $PROJECT as $ACCOUNT. If Cloud Shell asked to authorize, click Authorize and paste again."
ok "Project  $PROJECT"
ok "Account  $ACCOUNT"

# ---- 2. APIs ---------------------------------------------------------------------------------------------
step "Turning on the Google Cloud APIs"
spin "Enabling Gemini Enterprise (Discovery Engine), Google Drive and Cloud Storage APIs" \
  gcloud services enable discoveryengine.googleapis.com drive.googleapis.com storage.googleapis.com --project "$PROJECT" \
  || die "Could not enable the APIs (see $LOG)."
ok "APIs enabled: Discovery Engine, Google Drive, Cloud Storage"

# ---- 3. Gemini Enterprise --------------------------------------------------------------------------------
step "Setting up the Gemini Enterprise app"
BASE="$HOST/v1alpha/projects/$PROJECT/locations/$LOCATION"
BASE_V1="$HOST/v1/projects/$PROJECT/locations/$LOCATION"

api() {  # api METHOD URL [JSON]  -> $CODE (HTTP status) and $BODY; every call is logged
  local out; out="$(mktemp)"
  local args=(-s -o "$out" -w '%{http_code}' -X "$1" -H "Authorization: Bearer $(gcloud auth print-access-token 2>/dev/null)"
              -H "X-Goog-User-Project: $PROJECT" -H "Content-Type: application/json")
  [ -n "${3:-}" ] && args+=(--data "$3")
  CODE="$(curl "${args[@]}" "$2")"; BODY="$(cat "$out")"; rm -f "$out"
  log "API   $1 ${2#https://} -> $CODE"
  case "$CODE" in 2*) ;; *) log "      ${BODY:0:600}" ;; esac
}
jv() {  # jv 'python expression on d' -> prints it from $BODY ('' when missing)
  printf '%s' "$BODY" | python3 -c 'import json,sys
try: d=json.loads(sys.stdin.read() or "{}")
except Exception: d={}
try: v=eval(sys.argv[1])
except Exception: v=""
print("" if v is None else v)' "$1"
}
wait_op() {  # wait_op OPERATION_NAME  (up to 5 minutes)
  for _ in $(seq 100); do
    api GET "$HOST/v1alpha/$1"
    [ "$(jv 'd.get("done", False)')" = "True" ] && { [ -z "$(jv 'd.get("error","")')" ] && return 0 || return 1; }
    sleep 3
  done
  return 1
}

# 3a. Google identity for this location (the console's "Use Google Identity")
api GET "$BASE/aclConfig"
if [ "$(jv 'd["idpConfig"]["idpType"]')" != "GSUITE" ]; then
  api PATCH "$BASE/aclConfig" "{\"name\":\"projects/$PROJECT/locations/$LOCATION/aclConfig\",\"idpConfig\":{\"idpType\":\"GSUITE\"}}"
  [ "$CODE" = 200 ] || die "Could not set Google identity ($CODE): $(jv 'd["error"]["message"]')"
fi
ok "Sign-in method: Google Identity"

# 3b. Seats: the lab's 30-day trial must be active; new users get a seat automatically
api GET "$BASE_V1/licenseConfigs"
LICENSE="$(jv '[c["name"] for c in d.get("licenseConfigs",[]) if c.get("state")=="ACTIVE"][0]')"
if [ -z "$LICENSE" ]; then
  warn "No active Gemini Enterprise subscription in $LOCATION yet."
  info "Open https://console.cloud.google.com/gemini-enterprise/overview?project=$PROJECT"
  info "click 'Start 30-day free trial' (and 'Continue and activate the API' if shown), then come back."
  read -r -p "        Press Enter when that's done... " _ </dev/tty
  api GET "$BASE_V1/licenseConfigs"
  LICENSE="$(jv '[c["name"] for c in d.get("licenseConfigs",[]) if c.get("state")=="ACTIVE"][0]')"
  [ -n "$LICENSE" ] || die "Still no active subscription in $LOCATION."
fi
api GET "$BASE_V1/userStores/default_user_store"
if [ "$(jv 'd.get("enableLicenseAutoRegister", False)')" != "True" ]; then
  api PATCH "$BASE_V1/userStores/default_user_store?updateMask=enableLicenseAutoRegister,defaultLicenseConfig" \
    "{\"enableLicenseAutoRegister\":true,\"defaultLicenseConfig\":\"$LICENSE\"}"
  [ "$CODE" = 200 ] || warn "Could not turn on automatic seats ($CODE); assign one under Gemini Enterprise > Manage users."
fi
ok "License: $(basename "$LICENSE") (a seat is given automatically on first sign-in)"

# 3c. Google Drive connector (federated: searches each person's own Drive, nothing is copied)
connector() {  # connector SOURCE COLLECTION_ID "Display name"  -> sets DS (the connector's data store id)
  local url="$BASE/collections/$2/dataConnector"
  api GET "$url"
  if [ "$CODE" = 404 ]; then
    api POST "$BASE:setUpDataConnector" "{\"collectionId\":\"$2\",\"collectionDisplayName\":\"$3\",
      \"dataConnector\":{\"dataSource\":\"$1\",\"refreshInterval\":\"0s\",\"connectorModes\":[\"FEDERATED\"],
      \"entities\":[{\"entityName\":\"$1\"}],\"params\":{}}}"
    [ "$CODE" = 200 ] || die "Could not create the $3 connector ($CODE): $(jv 'd["error"]["message"]')"
    info "$3 connector created, waiting for it to become active..."
  fi
  for _ in $(seq 200); do
    api GET "$url"
    STATE="$(jv 'd.get("state","")')"
    DS="$(jv 'd["entities"][0]["dataStore"].split("/")[-1]')"
    [ "$STATE" = ACTIVE ] && [ -n "$DS" ] && return 0
    [ "$STATE" = FAILED ] && die "The $3 connector failed: $(jv 'd.get("errors","")')"
    sleep 3
  done
  die "The $3 connector is still '${STATE:-unknown}' after 10 minutes. Paste the script again later."
}
DS_IDS=()
for c in "google_drive|$DRIVE_STORE_ID|Google Drive"; do
  IFS='|' read -r SRC_NAME CID CNAME <<<"$c"
  connector "$SRC_NAME" "$CID" "$CNAME"
  DS_IDS+=("$DS")
  ok "$CNAME connector: active"
done
DS_JSON="$(printf '%s\n' "${DS_IDS[@]}" | python3 -c 'import json,sys; print(json.dumps(sys.stdin.read().split()))')"

# 3d. The app
ENGINE="$BASE/collections/default_collection/engines/$APP_ID"
api GET "$ENGINE"
if [ "$CODE" = 200 ]; then
  HAVE="$(jv "__import__('json').dumps(d.get('dataStoreIds', []))")"
  IDS="$(jv "__import__('json').dumps(d.get('dataStoreIds', []) + [x for x in $DS_JSON if x not in d.get('dataStoreIds', [])])")"
  if [ "$IDS" = "$HAVE" ]; then
    ok "App already set up: $APP_NAME"
  else
    api PATCH "$ENGINE?updateMask=dataStoreIds" "{\"dataStoreIds\":$IDS}"
    [ "$CODE" = 200 ] || die "Could not add the connectors to the app ($CODE): $(jv 'd["error"]["message"]')"
    ok "Added the missing connectors to $APP_NAME"
  fi
fi
if [ "$CODE" = 404 ]; then
  api POST "$BASE/collections/default_collection/engines?engineId=$APP_ID" "{
    \"displayName\":\"$APP_NAME\",\"solutionType\":\"SOLUTION_TYPE_SEARCH\",\"industryVertical\":\"GENERIC\",
    \"appType\":\"APP_TYPE_INTRANET\",\"dataStoreIds\":$DS_JSON,\"commonConfig\":{\"companyName\":\"$COMPANY\"},
    \"searchEngineConfig\":{\"searchTier\":\"SEARCH_TIER_ENTERPRISE\",\"searchAddOns\":[\"SEARCH_ADD_ON_LLM\"],
      \"requiredSubscriptionTier\":\"SUBSCRIPTION_TIER_SEARCH_AND_ASSISTANT\"},
    \"knowledgeGraphConfig\":{\"enablePrivateKnowledgeGraph\":true},
    \"sessionConfig\":{\"sessionManagementPolicy\":\"VERTEX_AI_MANAGED\"},
    \"observabilityConfig\":{\"observabilityEnabled\":true},
    \"features\":{\"no-code-agent-builder\":\"FEATURE_STATE_ON\",\"agent-gallery\":\"FEATURE_STATE_ON\",
      \"prompt-gallery\":\"FEATURE_STATE_ON\",\"notebook-lm\":\"FEATURE_STATE_ON\",\"model-selector\":\"FEATURE_STATE_ON\",
      \"workflow-agents\":\"FEATURE_STATE_ON\",\"agent-sharing-without-admin-approval\":\"FEATURE_STATE_ON\",
      \"disable-agent-sharing\":\"FEATURE_STATE_OFF\",\"personalization-memory\":\"FEATURE_STATE_ON\",
      \"people-search-org-chart\":\"FEATURE_STATE_ON\",\"disable-google-drive-upload\":\"FEATURE_STATE_OFF\",
      \"disable-image-generation\":\"FEATURE_STATE_OFF\",\"disable-video-generation\":\"FEATURE_STATE_OFF\",
      \"disable-talk-to-content\":\"FEATURE_STATE_OFF\"}}"
  [ "$CODE" = 200 ] || die "Could not create the app ($CODE): $(jv 'd["error"]["message"]')"
  OP="$(jv 'd["name"]')"
  if [ "$(jv 'd.get("done", False)')" != "True" ]; then
    spin "Creating the app" wait_op "$OP" || die "App creation did not finish (see $LOG)."
  fi
  ok "App created: $APP_NAME (Google Drive connected)"
elif [ "$CODE" != 200 ]; then
  die "Could not read the app ($CODE): $(jv 'd["error"]["message"]')"
fi

api GET "$ENGINE/widgetConfigs/default_search_widget_config"
CONFIG_ID="$(jv 'd["configId"]')"
[ -n "$CONFIG_ID" ] || die "Could not read the app's web address."
case "$LOCATION" in global) WEB_URL="https://vertexaisearch.cloud.google.com/home/cid/$CONFIG_ID" ;;
  *) WEB_URL="https://vertexaisearch.cloud.google.com/$LOCATION/home/cid/$CONFIG_ID" ;; esac
CONSOLE_URL="https://console.cloud.google.com/gemini-enterprise/locations/$LOCATION/engines/$APP_ID/overview?project=$PROJECT"
ok "App link: $WEB_URL"
printf 'GEMINI_ENTERPRISE_APP=%s\nADMIN_CONSOLE=%s\n' "$WEB_URL" "$CONSOLE_URL" > "$WORK/links.txt"

# ---- 4. Drive access -------------------------------------------------------------------------------------
step "Checking Google Drive access"
has_drive_scope() {
  local t; t="$(gcloud auth print-access-token 2>/dev/null)" || return 1
  curl -s "https://oauth2.googleapis.com/tokeninfo?access_token=$t" | grep -q 'auth/drive'
}
if has_drive_scope; then
  ok "This sign-in can already write to your Google Drive"
else
  log "token has no Drive scope -> gcloud auth login --enable-gdrive-access"
  printf '      \033[33mAction needed (once):\033[0m Cloud Shell needs your OK to put files in your Google Drive.\n'
  info "1. If asked \"Do you wish to proceed anyway (Y/n)?\", type Y and press Enter."
  info "2. Open the long link it prints, sign in as $ACCOUNT, and click Allow."
  info "3. Copy the code Google shows, paste it here, and press Enter."
  echo
  gcloud auth login "$ACCOUNT" --enable-gdrive-access --no-launch-browser --force --brief \
    || die "Drive sign-in did not finish. Paste the script again to retry."
  has_drive_scope || die "The new sign-in still has no Drive access. Make sure you clicked Allow."
  ok "Google Drive access approved"
fi

# ---- 5. demo data into My Drive -------------------------------------------------------------------------
step "Copying the Graywing demo data into your Google Drive"
cd "$WORK" || die "Can't open $WORK"
rm -f data.zip
case "$DATA_URL" in
  gs://*) spin "Downloading the demo data" gcloud storage cp "$DATA_URL" data.zip --quiet ;;
  *) spin "Downloading the demo data" curl -fsSL "$DATA_URL" -o data.zip ;;
esac
[ -s data.zip ] || die "Could not download the demo data from $DATA_URL"
rm -rf data && mkdir data && unzip -q data.zip -d data || die "The demo data zip is damaged."
DATA_DIR="$(find data -mindepth 1 -maxdepth 1 -type d | head -1)"
ok "Downloaded $(find "$DATA_DIR" -type f | wc -l | tr -d ' ') files ($(du -sh data.zip | cut -f1))"
cat > drive_upload_lab.py <<'PY_EOF'
"""Upload an unzipped demo-data folder into the signed-in user's My Drive (stdlib only; runs in Cloud Shell).

  python3 drive_upload_lab.py <folder> [id_file]

<folder> is the top folder from the zip (e.g. "Graywing Ag Systems (Demo Data)"); it becomes a folder of the
same name in My Drive. .xlsx/.docx/.pptx are converted to Sheets/Docs/Slides, PDFs and images stay files.
Re-runs reuse folders and skip files that already exist by name, so nothing is duplicated.
Speed: folders are made level by level (in parallel within a level), then files upload WORKERS at a time;
new writes start at most every WRITE_GAP seconds to stay inside Drive's per-user write rate.
Token: $DRIVE_TOKEN if set, else `gcloud auth print-access-token` (refreshed on 401).
Shows a live progress bar; logs one line per file to $UPLOAD_LOG (if set); writes the root folder id to id_file.
"""
import json
import os
import subprocess
import sys
import threading
import time
import urllib.error
import urllib.parse
import urllib.request
import uuid
from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import datetime

API = os.environ.get("DRIVE_API", "https://www.googleapis.com/drive/v3")
UPLOAD = os.environ.get("DRIVE_UPLOAD_API", "https://www.googleapis.com/upload/drive/v3")
FOLDER = "application/vnd.google-apps.folder"
CONVERT = {".xlsx": "application/vnd.google-apps.spreadsheet",
           ".docx": "application/vnd.google-apps.document",
           ".pptx": "application/vnd.google-apps.presentation"}
SOURCE = {".xlsx": "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
          ".docx": "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
          ".pptx": "application/vnd.openxmlformats-officedocument.presentationml.presentation",
          ".pdf": "application/pdf", ".jpg": "image/jpeg", ".jpeg": "image/jpeg", ".png": "image/png"}
WORKERS = int(os.environ.get("UPLOAD_WORKERS", "6"))
WRITE_GAP = float(os.environ.get("WRITE_GAP", "0.3"))

_token = os.environ.get("DRIVE_TOKEN", "")
_token_lock = threading.Lock()
_write_lock = threading.Lock()
_last_write = 0.0
# Cloud Shell's built-in credential needs a quota project on Drive calls ("drive.googleapis.com API requires a
# quota project"); a gcloud user login doesn't. Send it when given, drop it if the project refuses it.
QUOTA_PROJECT = os.environ.get("QUOTA_PROJECT", "")
_use_quota = bool(QUOTA_PROJECT)


def token(refresh=False):
    global _token
    with _token_lock:
        if refresh or not _token:
            _token = subprocess.run(["gcloud", "auth", "print-access-token"],
                                    capture_output=True, text=True).stdout.strip()
        return _token


def api_message(text):
    try:
        return json.loads(text)["error"]["message"]
    except Exception:
        return text[:300]


def pace_write():
    """Space out the start of write requests across all threads."""
    global _last_write
    with _write_lock:
        wait = WRITE_GAP - (time.time() - _last_write)
        if wait > 0:
            time.sleep(wait)
        _last_write = time.time()


def call(method, url, params=None, body=None, headers=None):
    global _use_quota
    if params:
        url += "?" + urllib.parse.urlencode(params)
    refresh = False
    for attempt in range(8):
        if method != "GET":
            pace_write()
        h = {"Authorization": "Bearer " + token(refresh)}
        if _use_quota:
            h["X-Goog-User-Project"] = QUOTA_PROJECT
        h.update(headers or {})
        refresh = False
        req = urllib.request.Request(url, data=body, headers=h, method=method)
        try:
            with urllib.request.urlopen(req, timeout=180) as r:
                raw = r.read()
                return json.loads(raw) if raw else {}
        except urllib.error.HTTPError as e:
            text = e.read().decode("utf-8", "replace")
            if e.code == 401 and attempt < 2:
                refresh = True
                continue
            if e.code == 403 and "quota project" in text and not _use_quota and QUOTA_PROJECT:
                _use_quota = True
                continue
            if e.code == 403 and _use_quota and ("USER_PROJECT_DENIED" in text or "serviceusage" in text):
                _use_quota = False
                continue
            if e.code in (429, 500, 502, 503, 504) or (e.code == 403 and "ateLimit" in text):
                time.sleep(min(30, 1.5 * 2 ** attempt))
                continue
            if e.code == 403 and "insufficient" in text.lower():
                sys.exit("\nDrive said the sign-in has no Drive access. Re-run the setup and approve Google Drive access.")
            sys.exit(f"\nGoogle Drive refused the request ({e.code}): {api_message(text)}")
        except urllib.error.URLError:
            time.sleep(min(30, 1.5 * 2 ** attempt))
    sys.exit(f"\nDrive API kept failing on {method} {url.split('?')[0]}")


def q_escape(s):
    return s.replace("\\", "\\\\").replace("'", "\\'")


def children(parent):
    out, params = [], {"q": f"'{parent}' in parents and trashed = false", "pageSize": 1000,
                       "fields": "nextPageToken, files(id,name,mimeType)"}
    while True:
        res = call("GET", f"{API}/files", params)
        out += res.get("files", [])
        if not res.get("nextPageToken"):
            return out
        params["pageToken"] = res["nextPageToken"]


def make_folder(parent, name):
    return call("POST", f"{API}/files", {"fields": "id"}, json.dumps(
        {"name": name, "mimeType": FOLDER, "parents": [parent]}).encode(), {"Content-Type": "application/json"})["id"]


def root_folder(name):
    q = (f"'root' in parents and name = '{q_escape(name)}' and mimeType = '{FOLDER}' "
         f"and trashed = false and 'me' in owners")
    found = call("GET", f"{API}/files", {"q": q, "fields": "files(id,createdTime)", "orderBy": "createdTime"})
    if found.get("files"):
        return found["files"][0]["id"], False
    return make_folder("root", name), True


def upload(parent, path, name, convert):
    ext = os.path.splitext(path)[1].lower()
    meta = {"name": name, "parents": [parent]}
    if convert:
        meta["mimeType"] = convert
    with open(path, "rb") as fh:
        data = fh.read()
    b = "gw" + uuid.uuid4().hex
    body = (f"--{b}\r\nContent-Type: application/json; charset=UTF-8\r\n\r\n{json.dumps(meta)}\r\n"
            f"--{b}\r\nContent-Type: {SOURCE.get(ext, 'application/octet-stream')}\r\n\r\n").encode() + data \
        + f"\r\n--{b}--".encode()
    call("POST", f"{UPLOAD}/files", {"uploadType": "multipart", "fields": "id"}, body,
         {"Content-Type": f"multipart/related; boundary={b}"})


def plan(local_root, root_id, root_existed, pool):
    """Walk the tree level by level: list existing folders, create missing ones (in parallel within a level).
    Returns the files still to upload and how many are already in Drive."""
    tasks, skipped = [], 0
    level = [(local_root, root_id, root_existed)]
    while level:
        listings = list(pool.map(lambda x: children(x[1]) if x[2] else [], level))
        creates, next_level = [], []
        for (path, fid, _), kids in zip(level, listings):
            folders = {k["name"]: k["id"] for k in kids if k["mimeType"] == FOLDER}
            files = {k["name"] for k in kids if k["mimeType"] != FOLDER}
            for entry in sorted(os.listdir(path)):
                full = os.path.join(path, entry)
                if entry.startswith("."):
                    continue
                if os.path.isdir(full):
                    if entry in folders:
                        next_level.append((full, folders[entry], True))
                    else:
                        creates.append((full, fid, entry))
                    continue
                stem, ext = os.path.splitext(entry)
                convert = CONVERT.get(ext.lower())
                name = stem if convert else entry
                rel = os.path.relpath(full, local_root)
                if name in files:
                    skipped += 1
                    log(f"skip  {rel} (already in Drive)")
                else:
                    tasks.append((fid, full, name, convert, rel))
        made = list(pool.map(lambda c: make_folder(c[1], c[2]), creates))
        next_level += [(c[0], new_id, False) for c, new_id in zip(creates, made)]
        level = next_level
    return tasks, skipped


def log(msg):
    path = os.environ.get("UPLOAD_LOG")
    if path:
        with open(path, "a", encoding="utf-8") as fh:
            fh.write(f"{datetime.now():%H:%M:%S}  DRIVE {msg}\n")


def bar(done, total, rel):
    total = total or 1
    width = 24
    fill = width * done // total
    where = os.path.dirname(rel).split(os.sep)[0] or "top folder"
    where = (where[:30] + "…") if len(where) > 31 else where
    sys.stdout.write(f"\r\033[K        [{'█' * fill}{'░' * (width - fill)}] {done:3}/{total} files "
                     f"{100 * done // total:3}%  \033[2m{where}\033[0m")
    sys.stdout.flush()


def main():
    local = os.path.abspath(sys.argv[1])
    id_file = sys.argv[2] if len(sys.argv) > 2 else None
    name = os.path.basename(local.rstrip("/"))
    total = sum(1 for _, _, fs in os.walk(local) for f in fs if not f.startswith("."))
    t0 = time.time()
    root_id, created = root_folder(name)
    print(f"        {'Created' if created else 'Found'} the folder '{name}' in My Drive", flush=True)
    log(f"root folder {root_id} ({'created' if created else 'reused'})")
    pool = ThreadPoolExecutor(max_workers=WORKERS)
    try:
        tasks, skipped = plan(local, root_id, not created, pool)
        done = skipped
        bar(done, total, "")
        futures = {pool.submit(upload, fid, full, nm, conv): (rel, conv) for fid, full, nm, conv, rel in tasks}
        for f in as_completed(futures):
            f.result()  # re-raises a failed upload (SystemExit with the reason)
            rel, conv = futures[f]
            done += 1
            log(f"put   {rel}" + (" -> Google " + conv.split(".")[-1].title() if conv else ""))
            bar(done, total, rel)
    except BaseException:
        pool.shutdown(wait=False, cancel_futures=True)
        raise
    pool.shutdown()
    sys.stdout.write("\n")
    n = len(tasks)
    print(f"        Uploaded {n} new file{'' if n == 1 else 's'}"
          + (f", {skipped} were already there" if skipped else "") + f" ({time.time() - t0:.0f}s)", flush=True)
    log(f"done: uploaded {n}, skipped {skipped}, {time.time() - t0:.0f}s with {WORKERS} at a time")
    if id_file:
        with open(id_file, "w") as fh:
            fh.write(root_id)
    else:
        print(f"ROOT_FOLDER_ID={root_id}")


if __name__ == "__main__":
    main()
PY_EOF
rm -f folder_id.txt
UPLOAD_LOG="$LOG" QUOTA_PROJECT="$PROJECT" python3 drive_upload_lab.py "$DATA_DIR" folder_id.txt || die "Drive upload stopped (see above and $LOG)."
FOLDER_ID="$(cat folder_id.txt 2>/dev/null)"
[ -n "$FOLDER_ID" ] || die "Drive upload did not finish."
DRIVE_URL="https://drive.google.com/drive/folders/$FOLDER_ID"
ok "Drive folder: $DRIVE_URL"
printf 'DEMO_DATA_DRIVE_FOLDER=%s\n' "$DRIVE_URL" >> "$WORK/links.txt"

# ---- 6. done ---------------------------------------------------------------------------------------------
step "All done"
log "######## setup finished in $(elapsed): app=$WEB_URL drive=$DRIVE_URL"
line="  ════════════════════════════════════════════════════════════════════════"
printf '\n\033[32m%s\033[0m\n' "$line"
printf '\033[1;32m   ✔ Setup complete in %s\033[0m\n\n' "$(elapsed)"
printf '   \033[1mYOUR GEMINI ENTERPRISE APP\033[0m  (open this and bookmark it)\n'
printf '   \033[4;36m%s\033[0m\n\n' "$WEB_URL"
printf '   \033[1mGRAYWING DEMO DATA IN YOUR GOOGLE DRIVE\033[0m\n'
printf '   \033[4;36m%s\033[0m\n\n' "$DRIVE_URL"
printf '   \033[2mAdmin console: %s\033[0m\n' "$CONSOLE_URL"
printf '   \033[2mLinks saved in %s · full log in %s\033[0m\n' "$WORK/links.txt" "$LOG"
printf '\033[32m%s\033[0m\n\n' "$line"
printf '   \033[1mNext (once):\033[0m\n'
printf '   1. Open the app link above (signed in as %s).\n' "$ACCOUNT"
printf '   2. Click \033[1mConnectors\033[0m and \033[1mAuthorize\033[0m next to Google Drive.\n'
printf '   3. Ask: "What does Graywing Ag Systems sell, and who are its biggest customers?"\n\n'
printf '   Show the links again any time with:  cat %s\n\n' "$WORK/links.txt"
