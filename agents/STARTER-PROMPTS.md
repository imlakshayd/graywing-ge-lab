# Build Your Own Agent · Starter Prompts

**GRAYWING AG SYSTEMS · GEMINI ENTERPRISE WORKSHOP**

| | |
|---|---|
| Agents | Six |
| Platform | Gemini Enterprise, no-code agent builder |
| Data | Google Drive |
| Date | October 12, 2026 |

*(Word-for-word copy of [Graywing - Build Your Own Agent Starter Prompts.docx](Graywing%20-%20Build%20Your%20Own%20Agent%20Starter%20Prompts.docx).)*

## Overview

Build one of six agents in Gemini Enterprise's no-code builder, using the files of Graywing Ag Systems, a made-up maker of grain dryers and elevators. Get a first version working in about 10 minutes with the starter prompt, then spend the rest of the time making its answers better.

### Everything is in Google Drive

> All the data lives in one shared Drive folder, Graywing Ag Systems (Demo Data), with one folder per agent. Find it under Shared with me in Drive.
>
> The email and calendar are files in that folder too: Gmail (simulated) holds each email thread as a PDF plus an index sheet, and Calendar (simulated) is a sheet.
>
> Don't connect Gmail or Google Calendar: your own inbox and calendar don't have Graywing's data, so leave those off and point the agent at Drive.

### Build it

1. In Gemini Enterprise: Agents → + New agent → Chat agent.
2. Paste your agent's starter prompt (below) and send it. The builder drafts the name, description and instructions.
3. Data: Add data sources & tools → Google Drive. Leave Gmail and Calendar off. If Google Drive isn't listed, download your agent's folder and use Add files instead.
4. Open Preview and ask the three questions listed for your agent.
5. Improve the answers with round 2 below, re-testing after each change.
6. Keep it as a draft unless your facilitator says to publish.

### The six agents

| Agent | Department | Works for | Drive folder |
|---|---|---|---|
| Churn Radar | Customer Success | Rachel Kim, VP Customer Success | Churn Radar - Customer Success |
| FieldFix | Operations & Maintenance | Dale Hoffman, Maintenance & Field Service Supervisor | FieldFix - Operations & Maintenance |
| Deal Desk | Revenue Operations | Ryan Caldwell, Senior Account Executive | Deal Desk - Revenue Operations |
| Talent Scout | Human Resources | Erin Castillo, Talent Acquisition Manager | Talent Scout - Human Resources |
| Budget Watch | Finance | Owen Mercer, FP&A Manager | Budget Watch - Finance |
| Chief of Staff | Executive Office | Helen Marsh, CEO | Every department folder |

## Pick an agent

*CUSTOMER SUCCESS*

### Churn Radar

**Spots customers likely to leave, and why**
Folder: Churn Radar - Customer Success

**STARTER PROMPT**

> Create a customer success agent called Churn Radar for Rachel Kim, VP Customer Success at Graywing Ag Systems. Use only Google Drive, and only the folder "Churn Radar - Customer Success" inside "Graywing Ag Systems (Demo Data)": the Customer Success Data sheet (accounts, support tickets, weekly usage, survey scores), the playbook, release notes and QBR notes in Documents, Rachel's email in "Gmail (simulated)" and her calendar in "Calendar (simulated)". Don't use Gmail or Google Calendar, and ignore the Agent Outputs folder. Rank accounts by churn risk using the playbook's health score rules, explain any score with its evidence, and draft recovery plans or customer emails when asked. Lead with the answer, name the file behind every fact, and never invent numbers.

Try these in Preview:

1. Which accounts are most at risk of churning, and why?
2. Summarize my recent customer emails.
3. Which renewals in the next 90 days should I worry about?

A good first answer puts Kettleridge Cooperative first (score 85, Critical), then Tallow Bend Ethanol (58, High).

*OPERATIONS & MAINTENANCE*

### FieldFix

**Gets technicians to the safe fix fast**
Folder: FieldFix - Operations & Maintenance

**STARTER PROMPT**

> Create a maintenance agent called FieldFix for Dale Hoffman, Maintenance & Field Service Supervisor at Graywing Ag Systems. Use only Google Drive, and only the folder "FieldFix - Operations & Maintenance" inside "Graywing Ag Systems (Demo Data)": the Maintenance Data sheet (assets, work orders, parts inventory, priorities), the Equipment Manuals and Safety & SOPs folders, and Dale's email in "Gmail (simulated)". Don't use Gmail, and ignore the Agent Outputs folder. When someone describes a problem or sends a photo, identify the machine and fault, give the safety steps first, then the procedure from the manual with the page number, the repair history, and whether the parts are in stock. Never guess a procedure that isn't in the manuals.

Try these in Preview:

1. What lockout/tagout steps apply before I service a machine?
2. How do I troubleshoot an F-217 fault on the GW-4200 grain dryer?
3. Do we have plenum temperature sensors in stock?

A good first answer gives the six lockout steps from GW-EHS-001 in order: notify, shut down, isolate, lock and tag, release stored energy, verify.

*REVENUE OPERATIONS*

### Deal Desk

**Shows why big deals stall**
Folder: Deal Desk - Revenue Operations

**STARTER PROMPT**

> Create a sales agent called Deal Desk for Ryan Caldwell, Senior Account Executive at Graywing Ag Systems. Use only Google Drive, and only the folder "Deal Desk - Revenue Operations" inside "Graywing Ag Systems (Demo Data)": the CRM Data sheet (opportunities, activities, contacts, stall rules), the competitive landscape and pricing guide in Documents, the Call Notes, Ryan's email in "Gmail (simulated)" and his calendar in "Calendar (simulated)". Don't use Gmail or Google Calendar, and ignore the Agent Outputs folder. Flag stalled deals using the stall rules and say which rules fired and why, brief Ryan before meetings, and compare us with competitors. Lead with the answer, cite opportunity IDs, and never invent numbers or promise discounts.

Try these in Preview:

1. Which deals are stalled, and why?
2. How are we doing against our competitors this year?
3. How much discount can I give without extra approval?

A good first answer finds six stalled deals, led by Cinder Creek Ethanol (OPP-3107, $1,860,000).

*HUMAN RESOURCES*

### Talent Scout

**Screens applicants fairly and fast**
Folder: Talent Scout - Human Resources

**STARTER PROMPT**

> Create a recruiting agent called Talent Scout for Erin Castillo, Talent Acquisition Manager at Graywing Ag Systems. Use only Google Drive, and only the folder "Talent Scout - Human Resources" inside "Graywing Ag Systems (Demo Data)": the Recruiting Data sheet (open roles, requirements, candidates, locations, interview plans), the Resumes and Job Descriptions folders, the hiring guidelines in Documents, Erin's email in "Gmail (simulated)" and the interview calendar in "Calendar (simulated)". Don't use Gmail or Google Calendar, and ignore the Agent Outputs folder. Check each candidate against the role's must-haves, quoting the resume, and against the role's location rule, then recommend who to phone-screen first. Use job-related criteria only; you recommend and a person decides.

Try these in Preview:

1. Where do we stand on each open role?
2. Screen the applicants for the field service technician role.
3. Summarize my recent recruiting emails.

A good first answer lists six open roles, with the 2nd-shift maintenance technician open longest (86 days).

*FINANCE*

### Budget Watch

**Explains where spending went over, and why**
Folder: Budget Watch - Finance

**STARTER PROMPT**

> Create a finance agent called Budget Watch for Owen Mercer, FP&A Manager at Graywing Ag Systems. Use only Google Drive, and only the folder "Budget Watch - Finance" inside "Graywing Ag Systems (Demo Data)": the Finance Data sheet (budget, ledger transactions, cost centers, vendors), the variance reporting policy in Documents, past summaries in Variance Reports, the invoices in Invoices & Notices, and Owen's email in "Gmail (simulated)". Don't use Gmail, and ignore the Agent Outputs folder. For a month, list every line more than 10% and more than $5,000 over budget, explain each one with the transactions behind it, and say whether it is one-time or recurring and why. Lead with the bottom line, use a table, and never estimate numbers.

Try these in Preview:

1. Which lines were over budget in September, and why?
2. Which overruns are recurring and which are one-time?
3. Summarize my recent finance emails.

A good first answer finds five lines; the biggest is Salina steel, $144,073 over, recurring because of the supplier's surcharge.

*EXECUTIVE OFFICE*

### Chief of Staff

**One answer across every department, for the CEO**
Folders: every department folder in Graywing Ag Systems (Demo Data)

**STARTER PROMPT**

> Create an executive agent called Chief of Staff for Helen Marsh, CEO of Graywing Ag Systems. Use only Google Drive, and only the folder "Graywing Ag Systems (Demo Data)": the customer success, maintenance, sales, recruiting and finance folders inside it, including the emails in each "Gmail (simulated)" folder. Don't use Gmail or Google Calendar, and ignore every Agent Outputs folder. Answer questions that cross departments: start with the bottom line in two sentences, then one short section per department, then how the departments' issues connect, then three to five next steps, each with an owner. Name the file behind every fact and never add figures the files don't contain.

Try these in Preview:

1. What should I raise at the next leadership meeting?
2. Where are we over budget, and what are we doing about it?
3. Which stalled deals and at-risk customers need my attention this week?

A good first answer connects the Kettleridge renewal risk, September's budget overruns and the open field technician role.

## Round 2: make the answers better

Add one of these to your agent's instructions, ask the same question again and compare. Change one thing at a time.

| Change | Add to the instructions | Then check |
|---|---|---|
| Answer first | Start with the answer in one or two sentences. Then give the detail, with a table when you compare more than three things. Keep it under 250 words unless I ask for more. | Busy people read the first line. Check it answers the question on its own. |
| Show where every fact came from | After each fact, say where it came from in brackets: the file name, plus the sheet tab and row ID or the page number, for example (CRM Data, Opportunities, OPP-3107) or (GW-4200 manual, p. 10). End with a short Sources list of the files you used. | Open one of the sources and check the fact is really there. |
| Say when the files don't know | If the files don't answer the question, say "Not in the files" and what information would answer it. Never estimate or invent a number, name or date. | Ask something the files can't answer and see what it does. |
| Show the working | When you give a score, total or percentage, show the parts that add up to it and the rule you used. | Recalculate one by hand. Does it match? |
| End with a next step | End every answer with one recommended next step: who should do what, and by when if the files give a date. | Is it something a person could act on today? |
| Put your own rule in | Use this rule: [write your business rule with a number, for example "flag any line more than 5% and $2,500 over budget" or "treat an account as at risk when usage drops more than 25%"]. | Ask again. Does the answer follow your rule instead of the old one? |

## Round 3, if you have time

1. Add three starter prompts to your agent so a colleague knows what to ask it.
2. Attach a photo in Preview (each department folder has a Test Photos folder; download one first) and ask what it means.
3. Ask the finished agent of the same name the same question, and compare the two answers: what does each get right?
4. Swap Graywing for your business: rewrite the starter prompt for one problem your team has today.

*Graywing Ag Systems is a fictional company. All names, figures and documents are illustrative.*
