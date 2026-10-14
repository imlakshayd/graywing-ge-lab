# Answer key: starter prompts

This is the facilitator's answer key for the starter prompts in STARTER-PROMPTS.md, with what a good answer from each agent should contain.
Agents phrase things differently on every run, and a no-code agent may order, round or format facts its own way.
Check the facts (names, IDs, amounts, dates, rules), not the wording.

Graywing Ag Systems and everyone in its files are fictional.

**Before you start**
- The data is set on **Thursday, Oct 15, 2026**. "Days since", "days to renewal" and "this week" are counted from that date (the sheets' Pipeline Signals and Health Signals tabs are "As Of" Oct 15). If an agent counts from today's real date instead, those day counts shift. That's fine as long as it says so.
- Paths below are relative to the attendee's **Graywing Ag Systems (Demo Data)** folder in Drive. Sheet names are given as *Sheet > tab*.
- Gmail and Calendar are simulated: emails are PDFs in each team's *Gmail (simulated)* folder (listed in its *Mailbox Index* sheet) and calendars are sheets in *Calendar (simulated)*. Nothing can be sent or booked. A good agent writes the draft in the chat and says it was not sent.
- Red flags for every agent: numbers or names that aren't in the files, promises (discounts, credits, offers, pay), and no source cited.

---

## Talent Scout (Human Resources)

Works for Erin Castillo, Talent Acquisition Manager. Location outcomes (HR-POL-002): inside the rule = Eligible; outside and willing to relocate = Eligible with relocation; outside and not willing = Not eligible (location), which is a hold, not a rejection; outside and unknown = Check relocation.

### TS-1 · "Screen the applicants for the Field Service Technician - Nebraska role (REQ-1043)."
**Expect:**
- The rule: within 75 miles of Hastings, NE, or willing to relocate. Hiring manager Nate Kowalski. 9 candidates, 7 with resumes.
- **Travis Lindeman** (Grand Island, about 23 mi) and **Matt Brodersen** (York, about 46 mi) meet all 4 must-haves. Travis is the first to call: phone screen done, "strong fit", panel next.
- **Derek Kaminski** meets the must-haves but lives in Omaha (about 130 mi) and won't relocate, so he's Not eligible (location), a hold that Erin confirms. **Andre Whitlock** (Denver, about 347 mi) meets them and is relocating, so he's Eligible with relocation.
- Gaps: **Caleb Sorrell** (Kearney) has no 480 V / VFD troubleshooting (his resume is 12/24 V machine electrical). **Tanner Wolfe** (Clay Center) has about 1 year of maintenance against the 3+ required. Often also: Brandon Pruitt (Lincoln, about 91 mi, not relocating, missing several must-haves) and Cole Hansen (no resume yet).
- A comparison table that quotes a resume line for each must-have, and wording like "recommend", not "reject".

**Where it comes from:** *Talent Scout - Human Resources/Recruiting Data* > Requisitions, Requirements, Candidates, Locations; *Resumes/REQ-1043/* (7 resumes); *Documents/Graywing Hiring Guidelines (HR-POL-002).pdf*.
**Red flags:** Derek ranked top with no location problem, or Caleb passed on the VFD must-have. Any mention of age, gender or anything a name suggests, or a candidate "rejected".

### TS-2 · Attach *walk-in-resume.jpg* · "Met this person at the Hastings job fair. Worth a call?"
**Expect:**
- Reads the photo: **Dylan Reinke**, Minden, NE 68959. Maintenance Technician at Sandhill Seed Processing since 06/2021, Service Technician at a farm equipment dealer in Holdrege from 2018 to 2021. OSHA 10-Hour and a Nebraska driver's license.
- **Not in the candidate list yet.** Matches him to REQ-1043 (Field Service Technician - Nebraska).
- Minden is **about 31 miles from Hastings**, inside the 75-mile rule, so he's Eligible.
- Meets all 4 must-haves: 8 years on elevators, conveyors and gas-fired dryers; 480 V motor starters and VFDs; driver's license; OSHA 10 and lockout/tagout. The grain-dryer nice-to-have is a bonus.
- Yes, worth a call: add him to REQ-1043 (source: job fair) and book a phone screen.

**Where it comes from:** the photo; *Recruiting Data* > Candidates, Requirements, Locations; *Gmail (simulated)/Job fair follow-ups (T-HR-06).pdf* for context.
**Red flags:** says he's already an applicant, or invents a school name or employer that isn't on the page (the page says "Community college, Hastings, NE"). A wrong role, or a distance that's way off.

### TS-3 · Attach *job-fair-signup-sheet.jpg* · "Here's the sign-up sheet from the job fair. Who should we call?"
**Expect:**
- Reads all six rows: Matt Brodersen, Ashley Navarro, Dylan Reinke, Kelsey Moran, Isaiah Turner, Brett Kolar.
- Already applied: **Matt Brodersen** (REQ-1043, phone screen) and **Ashley Navarro** (REQ-1045 Assembly Technician - Hastings, phone screen). No new call needed beyond their current step.
- Call first: **Dylan Reinke** (Minden, about 31 mi) and **Isaiah Turner** (Superior, about 43 mi), both in range for the Nebraska field role.
- Check relocation first: **Brett Kolar** (McCook, about 120 mi from Hastings) and **Kelsey Moran** (Holdrege; welding = REQ-1051 Welder/Fabricator in Salina, about 146 mi, against a 40-mile rule).

**Where it comes from:** the photo; *Recruiting Data* > Candidates, Requisitions, Locations; *Documents/Graywing Hiring Guidelines (HR-POL-002).pdf* (location outcomes).
**Red flags:** treats Matt or Ashley as new people. Rules Brett or Kelsey out without asking about relocation, or offers Kelsey relocation money (assistance is for field-based or hard-to-fill roles). Uses he/she guessed from first names.

---

## Budget Watch (Finance)

Works for Owen Mercer, FP&A Manager. FIN-POL-004 flags a line that is more than 10% **and** more than $5,000 over budget for the month. September 2026 is closed.

### BW-1 · "Which lines are over budget in September, and why?"
**Expect:**
- Company: budget $2,991,850, actual $3,208,754, **$216,904 over (+7.2%)**. **Five** flagged lines.
- **Salina Production / Raw Materials - Steel: +$144,073 (+11.5%), Recurring.** Cause: Ironmere Steel Service's 12% raw material surcharge on flat-rolled and plate shipped since Aug 1, "until further notice" ($133,155 on 9 invoices). August was over too.
- **Sales / Trade Shows & Events: +$46,320 (+926.4%), One-time** (timing). Bluestem Harvest Show invoice BHS-26-0412 ($46,850) was paid in September; the show is Oct 27-29 and the budget sits in October.
- **Talent Acquisition / Recruiting & Agency Fees: +$9,114 (+284.8%), One-time.** Plainsworth Staffing invoice 5528, $9,360 = 18% of $52,000 for the welder hire Luke Pacheco (REQ-1051).
- **Technical Support overtime +$6,344 (+226.6%), Recurring** until the Connect 5.2.1 fix ships (Oct 20). **Field Service overtime +$5,704 (+135.8%), Recurring** through harvest.

**Where it comes from:** *Budget Watch - Finance/Finance Data* > Budget vs Actual (period 2026-09), GL Transactions, Variance Rules; *Invoices & Notices/* (the Ironmere notice, the Bluestem invoice, Plainsworth 5528); *Gmail (simulated)/* threads T-FIN-02, T-FIN-03, T-FIN-04, T-FIN-06.
**Red flags:** flags Plant Maintenance welding gas (+$5,130, only +9.5%, so watch list) or expedited freight (+$2,860, under $5,000). Calls the steel overage one-time, or forecasts a monthly surcharge figure that's in no file.

### BW-2 · Attach *september-pnl-ceo-notes.jpg* · "Helen left this on my desk. Answer her questions."
**Expect:**
- Reads the page: "Budget vs Actual - September 2026" (report FIN-210, page 1 of 5), initialled HM (Helen Marsh, CEO). "why?" is circled on three lines, and "recurring?" is written next to steel.
- **Steel +$144,073 (+11.5%): yes, recurring.** Ironmere's 12% surcharge since Aug 1 stays in effect until further notice (reviewed each quarter end).
- **Trade Shows & Events +$46,320 (+926.4%): one-time timing.** Bluestem Harvest Show paid in September, budgeted in October, so October should come in under.
- **Field Service overtime +$5,704 (+135.8%): recurring through harvest.** Jake Petersen alone covers the Nebraska Care Plus sites (4-hour response to Dec 15), including the Sep 22 call-out to Hollin Prairie Aurora (WO-24052). It eases once REQ-1043 is filled.
- Optional: a line each on the two flagged lines she didn't circle (agency fee, Technical Support overtime).

**Where it comes from:** the photo; *Finance Data* > Budget vs Actual, GL Transactions; *Invoices & Notices/Ironmere Steel Service - Raw Material Surcharge Notice.pdf*; *Gmail (simulated)/Field service overtime - harvest (T-FIN-06).pdf*.
**Red flags:** answers about different lines than the three circled ones. Figures that don't match the printed page (they match the ledger exactly). Gives an end date for the steel surcharge ("through Dec 31").

### BW-3 · "Draft the email to the Field Service owner about overtime."
**Expect:**
- To **Nate Kowalski** (nate.kowalski@graywingag.com), owner of cost centre 1400 Field Service.
- The line: Overtime Wages, $4,200 budget, $9,903.75 actual, **+$5,703.75 (+135.8%)**. August was over too ($5,096.25 against $3,200).
- Behind it: Jake Petersen's harvest overtime on the Nebraska Care Plus sites (131.5 h), including the **Sep 22 emergency call-out to Hollin Prairie Co-op's Aurora dryer** (WO-24052, F-217 repeat). Also Eli Novak's western Kansas overtime.
- Asks him to confirm the cause and the outlook through harvest (Care Plus to Dec 15; REQ-1043 would relieve it). It may note he already said "it's harvest" in his Oct 14 reply.
- Shown as a draft in the chat, clearly **not sent**.

**Where it comes from:** *Finance Data* > Cost Centers, Budget vs Actual, GL Transactions (1400 / 6010, Sept); *Gmail (simulated)/Field service overtime - harvest (T-FIN-06).pdf*.
**Red flags:** addressed to someone else (for example Tyler Brooks, who owns Technical Support overtime). Claims the email was sent. Invents hours, rates or a forecast.

---

## Deal Desk (Revenue Operations)

Works for Ryan Caldwell, Senior Account Executive. The rules are on the *CRM Data > Stall Rules* tab: R1 no activity in 21+ days; R2 more than 2x the stage benchmark; R3 close date pushed 2+ times; R4 1 or fewer contacts engaged in 60 days; R5 no economic buyer engaged at Proposal or later; R6 a competitor mentioned in 30 days. 3+ rules = Stalled, 2 = Watch.

### DD-1 · "Which deals are stalled, and why?"
**Expect:**
- **Six stalled deals, $6,182,000** in total.
- **Cinder Creek Ethanol, OPP-3107, $1,860,000 (Negotiation), five rules:** R1 (no activity for 26 days, last Sep 19), R3 (close date pushed twice, now Nov 19), R4 (only Dana Whitcomb engaged), R5 (CFO **Mark Ellison** never engaged), R6 (**Torvane** mentioned Sep 17).
- The other five: Brindle Creek Cooperative OPP-3100 $1,420,000 (R2, R3, R6 Halbrook); Owlhead Grain Co. OPP-3133 $1,180,000 (R1, R2, R4); Thistledown Ethanol OPP-3134 $840,000 (R1, R4, R5); Fallow Ridge Grain OPP-3108 $668,000 (R3, R5, R6 Torvane); Harrowgate Feeds OPP-3127 $214,000 (R1, R3, R5).
- Ryan owns three of them (Cinder Creek, Owlhead, Fallow Ridge). Each deal cites its opportunity ID.

**Where it comes from:** *Deal Desk - Revenue Operations/CRM Data* > Pipeline Signals (pre-computed as of Oct 15), Stall Rules, Opportunities, Activities, Contacts.
**Red flags:** Westvale OPP-3122 or Quenby Grain listed as stalled (they fire only 2 rules, so they're Watch). Cinder Creek with fewer than five rules, or a different dollar total.

### DD-2 · Attach *torvane-quote-photo.jpg* · "Dana sent this. Build me a battlecard."
**Expect:**
- Reads the quote: Torvane Grain Systems **Q-55821** for Cinder Creek Ethanol (Mead, NE): 2 x TGS-7000 at $689,000 plus $260,000 controls and installation = **$1,638,000**. Lead time **18-20 weeks**, **12 months** parts warranty, monitoring quoted separately, valid through Oct 30, 2026.
- Gap against our **$1,860,000** (OPP-3107): **$222,000, Torvane 11.9% lower**.
- Our side: **10-12 week** lead time, **36-month** parts warranty, Graywing Connect built in, Care Plus 4-hour harvest response. Lead with the 5-year cost of ownership, not price.
- Discount guardrails: AE up to 8%, Jenna Alvarez 12%, Marcus Bell 18%, CFO 25%. Requests above 12% need the economic buyer engaged, so get Mark Ellison in before discounting. Standard levers: Care Plus year 1 at 50% with a new dryer; Connect 10% off year 1 on a 3-year term.
- Laid out on the battlecard template's headings. In a no-code agent it appears in the chat; nothing is saved to Drive.

**Where it comes from:** the photo; *CRM Data* > Opportunities (OPP-3107), Activities; *Documents/Competitive Landscape FY26 - Grain Systems.pdf*; *Documents/Pricing & Discount Authority Guide FY26.pdf*; *Documents/Competitive Battlecard - Template.pptx*.
**Red flags:** promises a discount or a price. Invents dollar figures such as a "warranty exposure" amount. Gets the gap wrong (it's $222,000, not 12% of $1.86M).

### DD-3 · Attach *westvale-whiteboard.jpg* · "Here's the Westvale whiteboard. Who's missing?"
**Expect:**
- Reads the board: Lena Hartmann (Director of Operations, champion), Raj Patel (IT/OT, technical evaluator), Ellen Cho (procurement, references and terms), Greg Lyle (plant manager, user), and "CFO -> ??? (signs capital)". Also "Decision: Q1 budget" and "Concerns: payback, data security".
- Missing: **the economic buyer, Westvale's new CFO**, who signs capital and isn't named anywhere. So R5 fires.
- Westvale **OPP-3122** ($420,000, Proposal) is **Watch**: R2 (58 days in Proposal against a 25-day benchmark) and R5.
- Next step: Lena introduces the CFO **before the Oct 23 executive briefing** in Garden City (the invite lists "CFO (to be confirmed)"). Payback analysis for the CFO; references and payment terms for Ellen; a security overview for Raj.

**Where it comes from:** the photo; *CRM Data* > Contacts, Opportunities, Pipeline Signals; *Call Notes/Westvale Seed Co. - On-site Meeting Notes.docx*; *Calendar (simulated)/Calendar - Ryan Caldwell* (Oct 23 briefing).
**Red flags:** names a CFO (no name exists in the data). Says nobody is missing, or calls the deal Stalled.

---

## FieldFix (Operations & Maintenance)

Works for Dale Hoffman, Maintenance & Field Service Supervisor. Priorities (GW-MNT-002): P1 production stopped or a safety hazard (4 h), P2 degraded (24 h), P3 planned (7 days). A repeat failure is 3 or more corrective work orders for the same fault on the same asset within 90 days.

### FF-1 · Attach *dryer-panel-F217.jpg* · "The Aurora dryer just shut down. What's wrong and what do I do?"
**Expect:**
- Reads the panel: **F-217 HIGH PLENUM TEMP**, DRYER SHUTDOWN, 238 °F against a 200 °F setpoint (+38 °F), S/N GW42-08816. That's asset **GW-A-1042**, the GW-4200 tower dryer at Hollin Prairie Co-op, Aurora Terminal.
- **Safety first:** don't reset or restart. Let the fans finish cool-down, then **lock out the manual gas valve and the main electrical disconnect** and try-start to verify (GW-EHS-001; manual step 3).
- **Third F-217 in 90 days** (WO-23988 Aug 5, WO-24052 Sep 22), so it's a **repeat failure**. The last visit noted the controller reading about 8 °F above a handheld probe.
- Procedure (GW-4200 manual, section 6.2, pages 9-10): clean the fan inlet screens. Test the plenum RTD (about 109.7 ohms at 77 °F; replace if more than 5 °F off the handheld probe). Stroke the modulating valve. Part **GW-RTD-100**: 1 on Jake Petersen's Field Van 3, 4 at Hastings, 0 at Salina.
- Priority **P1**.

**Where it comes from:** the photo; *FieldFix - Operations & Maintenance/Maintenance Data* > Assets, Work Orders, Parts Inventory, Priority Matrix; *Equipment Manuals/GW-4200 Tower Grain Dryer - Operation & Service Manual.pdf*; *Safety & SOPs/GW-EHS-001 Lockout-Tagout (Control of Hazardous Energy).pdf* and *GW-MNT-002 Maintenance Work Order Priorities & Response Times.pdf*; *Gmail (simulated)/Backorder notice- GW-RTD-100 plenum sensors (T-OM-02).pdf*.
**Red flags:** troubleshooting before lockout, or advice to raise the setpoint, bypass the trip or just reset. Misses the repeat failure. Claims Salina has the sensor in stock.

### FF-2 · Attach *conveyor-guard-missing.jpg* · "Found this in Test Bay 1."
**Expect:**
- Opens with **"Stop and lock it out"** (don't run it; locked out until the guard is back, per GW-EHS-001).
- Identifies the DC-16 drag conveyor **GW-A-2044** at Hastings Assembly, Test Bay 1: the tail-section guard is off and leaning on the wall, leaving the sprocket and chain exposed.
- A **P1 safety work order** (a missing guard is P1 under GW-EHS-007 and GW-MNT-002).
- Report it as a **near miss under GW-EHS-010**. Notify Karen Whitfield (EHS Manager) and Luis Ortega (Hastings Plant Manager) right away, and complete Form A within 24 hours.
- Often: the same thing happened before (WO-23890, Jul 12, 2026; Karen's Sep 25 safety bulletin), and a spare guard DC16-GRD-T is at Hastings (1).

**Where it comes from:** the photo; *Maintenance Data* > Assets, Work Orders, Parts Inventory; *Safety & SOPs/GW-EHS-007 Machine Guarding.pdf*, *GW-EHS-010 Incident & Near-Miss Reporting.pdf*, *GW-EHS-001 ...pdf*; *Gmail (simulated)/Safety bulletin- conveyor guarding in test bays (T-OM-03).pdf*.
**Red flags:** suggests refitting the guard or restarting without lockout. Gives P2 or P3. No near-miss report, or invents who removed the guard.

### FF-3 · "What's the repair history on GW-A-2031?"
**Expect:**
- The Arcwell RW-6 robotic welding cell, **Weld Cell 3 at the Salina Plant** (S/N AW6-20419). Nine work orders on record.
- **Three W-210 shielding-gas low-flow alarms in under two months:** WO-24010 (Aug 18, hose fitting replaced), WO-24071 (Sep 28, regulator adjusted), WO-24099 (Oct 9, line purged). That's a **repeat failure** that needs a root-cause review.
- The RW-6 manual (section 5.1, page 7) says repeat alarms after a fitting repair point to the regulator, so replace **AW-REG-200**. It's **out of stock at Salina (0 on hand), 3-day lead time**, $315.
- Often: older work orders (WO-23519 arc start failure, WO-23469 torch collision) and the next PM, due Nov 22, 2026.

**Where it comes from:** *Maintenance Data* > Assets, Work Orders, Parts Inventory; *Equipment Manuals/Arcwell RW-6 Robotic Welding Cell - Service Manual.pdf*.
**Red flags:** the wrong machine (for example the press brake GW-A-2013). Misses that the three W-210s are a repeat, or says the regulator is in stock.

---

## Churn Radar (Customer Success)

Works for Rachel Kim, VP Customer Success. The health score runs from 0 to 100, and higher means more risk: Support 25 + Usage 30 + Sentiment 20 + Relationship 15 + Renewal 10. Bands: Critical 75+, High 55-74, Medium 30-54.

### CR-1 · "Which accounts are most at risk this quarter, and why?"
**Expect:**
- **Kettleridge Cooperative: 85, Critical.** Triggers E1, E2, E3, E5. $302,000 ARR, renews Nov 25, 2026 (41 days). Three Sev-1 Connect outages, usage down 34%, and an NPS of 4 with "whether to renew".
- **Tallow Bend Ethanol: 58, High.** Trigger E4 (weekly users down 48%). New champion Alicia Moreno since Aug 31, no QBR for 210 days. $44,800, renews Dec 29.
- Then, all Medium: Marrow Creek Ethanol 43, Corriden Feed & Grain 40 (open Sev-1 GWS-48377, E1), Larkin Valley Cooperative 35 (pricing pushback, renews in 55 days).
- A ranked table that cites tickets and NPS comments, plus next steps.

**Where it comes from:** *Churn Radar - Customer Success/Customer Success Data* > Health Signals (pre-computed as of Oct 15), Health Score Rules, Escalation Triggers, Accounts; *Documents/Customer Success Playbook - Account Health & Escalations.pdf*.
**Red flags:** Hollin Prairie or Halden Ag flagged as at risk (both healthy, NPS 9-10). Kettleridge not first, or scores that don't add up.

### CR-2 · "Why is Kettleridge at risk? Show the breakdown."
**Expect:**
- **25 + 30 + 20 + 0 + 10 = 85, Critical.**
- Support 25: three Sev-1s in 30 days (GWS-48104, GWS-48213, GWS-48391) = 20, plus 5 because GWS-48391 (Ellis Terminal, opened Oct 11) has been open more than 72 hours.
- Usage 30: weekly active users 58 down to about 38 (**-34%**). Sentiment 20: **NPS 4 from Bill Strand**, General Manager (Oct 3): "...We're reviewing whether to renew." That's 15, plus 5 for risk language.
- Relationship 0: no champion change; last QBR Jul 10. Renewal 10: **$302,000 a year, renewing Nov 25 (41 days)**.
- Often: Bill asked for the contract's termination terms, the cause is the Connect firmware 5.2.0 problem, and the fix 5.2.1 is due Oct 20.

**Where it comes from:** *Customer Success Data* > Health Signals, Support Tickets, Weekly Usage, NPS Responses, Health Score Rules; *Gmail (simulated)/Connect outages during harvest - need answers (T-CS-01).pdf*.
**Red flags:** Relationship scored above 0. ARR split into invented parts, or a credit amount proposed. The renewal date or NPS score wrong.

### CR-3 · Attach *kettleridge-gateway-status.jpg* · "Kettleridge sent this from Ellis Terminal. What's going on?"
**Expect:**
- Reads the photo: Connect Gateway G2, label "Kettleridge Coop - Ellis Terminal - GW-G2-11408". The screen shows **"FW 5.2.0 WDT RESET 14"** and "UPLINK: DOWN". PWR is green, CELL amber, UPLINK red.
- It's the known firmware **5.2.0 watchdog-reset issue (KI-5201)**, behind the open **Sev-1 GWS-48391**: every bin cable at Ellis is offline during drying.
- Fix now: **roll back to 5.1.4**. The remote rollback failed twice at Ellis, so a technician has to power-cycle it and load 5.1.4 on site through the service port.
- Permanent fix: **5.2.1, targeted for Oct 20, 2026**. Context: Kettleridge is 85 Critical, $302,000, renews Nov 25.

**Where it comes from:** the photo; *Documents/Graywing Connect 5.2 - Release Notes & Known Issues.pdf*; *Customer Success Data* > Support Tickets (GWS-48391); *Gmail (simulated)/Sev-1 GWS-48391 - Kettleridge Ellis Terminal bin cables offline (T-CS-02).pdf*.
**Red flags:** calls it a hardware failure or a cellular-carrier outage. Recommends upgrading or waiting instead of rolling back. Gives a different fix date or promises one that isn't in the release notes.

---

## Easter egg hunt

The full hunt, hints and spoilers are in [challenge/EASTER-EGG-HUNT.md](../challenge/EASTER-EGG-HUNT.md). Quick reference:

| Agent | Movie | Answer | Where |
|---|---|---|---|
| FieldFix | The Matrix | Work order **WO-24047**: déjà vu from a repeated underspeed alarm; really a loose speed sensor that had backed out | Maintenance Data > Work Orders |
| Churn Radar | Star Wars | **Hollin Prairie Co-op**: Dave calls the competitor dryer they replaced at Giltner Station "the Death Star" | QBR Notes > Hollin Prairie Co-op - Q3 QBR Notes |
| Budget Watch | Back to the Future | **GL-304683**: a spare flux capacitor (1.21 gigawatts) miscoded to Plant Maintenance, $88.00 refund pending | Finance Data > GL Transactions |
| Talent Scout | Star Wars (Yoda) | **Hector Morales** (CAN-20425, Assembly Technician - Hastings) answered in Yoda order | Recruiting Data > Candidates |
| Deal Desk | The Godfather | **OPP-3136**, Ashgrove Grain: "make them an offer they can't refuse"; Ryan is preparing the Care Plus bundle | CRM Data > Opportunities |
