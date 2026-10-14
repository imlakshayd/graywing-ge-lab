# Graywing Ag Systems · Gemini Enterprise lab

Everything you need to set up a Gemini Enterprise app over the demo data for **Graywing Ag Systems**, build your own no-code agents, and check their answers. Graywing is a fictional agriculture-equipment company; all names, numbers and documents are made up.

## What's in this repo

| File | What it is |
|---|---|
| `graywing-demo-data.zip` | The demo data: 124 files (spreadsheets, documents, manuals, simulated email and calendar printouts, test photos) in one folder per team. The setup script downloads this file; nothing else in the repo is part of the data. |
| `setup/PASTE-INTO-CLOUD-SHELL.txt` | The setup script, ready to paste into Cloud Shell. |
| `setup/graywing-setup.sh` | The same script as a plain file. |
| `agents/STARTER-PROMPTS.md` | Build cards for five no-code agents (Talent Scout, Budget Watch, Deal Desk, FieldFix, Churn Radar): instructions to paste and prompts to test with. |
| `agents/ANSWER-KEY.md` | For every test prompt, roughly what a good answer contains, where the facts come from, and signs of a wrong answer. |
| `challenge/EASTER-EGG-HUNT.md` | Five movie references hidden in Graywing's files: one challenge per agent, answers at the bottom. |

## Get started (about 2 minutes)

You need a Google Cloud project where you can turn on Gemini Enterprise (for example a Qwiklabs lab project) and a Google Workspace account.

1. Open the Google Cloud console, select your project, and click **Activate Cloud Shell** (the `>_` icon at the top).
2. Run the setup, using either option:
   - **One line:**
     ```
     bash <(curl -fsSL https://raw.githubusercontent.com/imlakshayd/graywing-ge-lab/main/setup/graywing-setup.sh)
     ```
   - **Paste:** copy the whole of `setup/PASTE-INTO-CLOUD-SHELL.txt` into Cloud Shell and press Enter.
3. Watch the six steps finish. The script:
   - turns on the APIs
   - creates a Gemini Enterprise app called **Graywing Ag Systems** with a Google Drive connector
   - copies the demo data into your My Drive under **Graywing Ag Systems (Demo Data)**

   The green box at the end shows your **app link** and your **Drive folder link**. To see them again later, run `cat ~/graywing-lab/links.txt`.
4. Open the app link, click **Connectors**, and **Authorize** Google Drive.
5. Ask: *"What does Graywing Ag Systems sell, and who are its biggest customers?"*

It's safe to run the script again: it reuses what's already there and never duplicates files. A full log is in `~/graywing-lab/setup.log`.

## Then

- **Build an agent:** pick a card in `agents/STARTER-PROMPTS.md`, create the agent in the app (Agents > + New agent), add Google Drive, and try its test prompts.
- **Check the answers:** compare them with `agents/ANSWER-KEY.md`. Wording will differ; check the facts.
- **Hunt for the Easter eggs:** see `challenge/EASTER-EGG-HUNT.md`.

## Good to know

- Email and calendar are **simulated as files** in Drive (the "Gmail (simulated)" and "Calendar (simulated)" folders), not real mailboxes.
- The data is set around **Thursday, Oct 15, 2026**. Answers that count days ("41 days to renewal") assume that date.
- The Google Drive connector only searches your own Drive, so each person sees only their own copy of the data.
