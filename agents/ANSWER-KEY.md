# Answer key: starter prompts

What a good answer looks like for the three "Try these in Preview" prompts of each agent, so you can check an attendee's answer at a glance.
Check the facts (names, IDs, amounts, dates), not the wording: agents phrase, round and order things their own way.
The data is set on Thursday, Oct 15, 2026, so day counts ("days to renewal", "open 86 days", "this week") assume that date.

Graywing Ag Systems and everyone in its files are fictional.

---

## Churn Radar (Customer Success)

| # | Prompt | A good answer… | Wrong if… |
|---|---|---|---|
| CR-1 | Which accounts are most at risk of churning, and why? | puts Kettleridge Cooperative first (85, Critical: three Sev-1 outages, users down 34%, NPS 4 "whether to renew"), then Tallow Bend Ethanol (58, High: users down 48%, new champion); cites the health score rules. | Kettleridge not first; invents a score; flags Hollin Prairie or Halden Ag. |
| CR-2 | Summarize my recent customer emails. | leads with Kettleridge: Bill Strand wants termination terms before the Nov 25 renewal; Ellis Sev-1 GWS-48391 needs a site visit. Then Corriden (controller down, billed twice), Larkin Valley pricing pushback, Hollin Prairie's bin 7 save. | finds no emails (Gmail on instead of Drive); misses Kettleridge. |
| CR-3 | Which renewals in the next 90 days should I worry about? | finds four by Jan 13: Kettleridge (Nov 25, 41 days, $302,000, Critical) is the worry; then Larkin Valley (Dec 9, $106,400, price pushback) and Tallow Bend (Dec 29, $44,800, High). Belden Milling ($3,600) is low risk. | misses Kettleridge or Larkin Valley; counts Marrow Creek (95 days) as inside 90. |

---

## FieldFix (Operations & Maintenance)

| # | Prompt | A good answer… | Wrong if… |
|---|---|---|---|
| FF-1 | What lockout/tagout steps apply before I service a machine? | gives the six steps of GW-EHS-001 in order: notify, shut down, isolate, lock and tag, release stored energy, verify zero energy (try-start). Often adds machine rules, e.g. dryers: lock gas valve and electrical disconnect. | steps missing or out of order; no try-start; treats an E-stop as isolation. |
| FF-2 | How do I troubleshoot an F-217 fault on the GW-4200 grain dryer? | follows manual section 6.2, pp. 9-10: don't reset; let fans cool, lock out gas and electrical; check inlet screen, plenum RTD (about 109.7 ohms at 77 °F), modulating valve, in that order. | troubleshoots before lockout; says raise the setpoint, bypass or just reset; no page. |
| FF-3 | Do we have plenum temperature sensors in stock? | says yes, part GW-RTD-100 ($186): 4 at Hastings Assembly, 1 on Jake Petersen's Field Van 3, 0 at Salina (backordered, 5-day lead time). Pull from Hastings if needed. | says Salina has stock; wrong part; invents quantities. |

---

## Deal Desk (Revenue Operations)

| # | Prompt | A good answer… | Wrong if… |
|---|---|---|---|
| DD-1 | Which deals are stalled, and why? | finds six stalled deals, $6,182,000, led by Cinder Creek Ethanol (OPP-3107, $1,860,000; five rules incl. no activity 26 days, CFO Mark Ellison not engaged, Torvane). Others: Brindle Creek, Owlhead, Thistledown, Fallow Ridge, Harrowgate. | lists Westvale or Quenby (only Watch); no rule IDs; a different total. |
| DD-2 | How are we doing against our competitors this year? | names Torvane as the problem: won about 1 in 3 (3 of 8 over 12 months, or 2 of 6 in 2026), 14 mentions in 9 deals. Corvex and Halbrook: we win half or more; overall about 57%. | invents win rates or market share; talking points with no numbers. |
| DD-3 | How much discount can I give without extra approval? | says up to 8% off list (Pricing & Discount Authority Guide FY26). Standard programs don't count against it (Care Plus year 1 at 50%, Connect 3-year 10% off). Above 8%: Jenna 12%, Marcus 18%, CFO 25%. | allows more than 8%; promises a discount; discounts freight or installation. |

---

## Talent Scout (Human Resources)

| # | Prompt | A good answer… | Wrong if… |
|---|---|---|---|
| TS-1 | Where do we stand on each open role? | lists six open roles (seven openings), longest REQ-1039 2nd-shift maintenance technician (86 days). Then REQ-1043 field tech (66; Travis Lindeman to panel), REQ-1045 (59; offer out), REQ-1047 (42), REQ-1051 (37; one filled), REQ-1053 (17). | misses a role; days open way off; REQ-1039 not the longest. |
| TS-2 | Screen the applicants for the field service technician role. | uses REQ-1043's rule (75 miles of Hastings or relocating): Travis Lindeman and Matt Brodersen meet all four must-haves; call Travis first. Derek Kaminski qualifies but Omaha, not relocating (hold). Caleb Sorrell lacks 480 V/VFD; Tanner Wolfe lacks experience. | ranks Derek top; passes Caleb on VFD; mentions age or gender, or "rejects". |
| TS-3 | Summarize my recent recruiting emails. | picks out three hiring managers pushing: Nate (two REQ-1043 finalists by end of October; Jake alone in Nebraska), Tyler (Tier 2 hire, REQ-1047), Greg (2nd-shift maintenance, REQ-1039). Also job fair follow-ups and Travis Lindeman's panel availability. | finds no emails (Gmail on instead of Drive); invents candidates or dates. |

---

## Budget Watch (Finance)

| # | Prompt | A good answer… | Wrong if… |
|---|---|---|---|
| BW-1 | Which lines were over budget in September, and why? | finds $216,904 over (+7.2%) and five lines: Salina steel +$144,073 (Ironmere 12% surcharge), Bluestem trade show +$46,320, agency fee +$9,114, Technical Support overtime +$6,344, Field Service overtime +$5,704; each with its transactions. | flags welding gas (+9.5%) or freight (under $5,000); ignores the 10%-and-$5,000 rule. |
| BW-2 | Which overruns are recurring and which are one-time? | splits them: recurring (about $156,120) is steel (surcharge until further notice), Technical Support overtime (until 5.2.1, Oct 20), Field Service overtime (through harvest, Dec 15). One-time ($55,434): Bluestem show (timing), agency fee. | calls steel one-time; gives the surcharge an end date; invents a forecast. |
| BW-3 | Summarize my recent finance emails. | leads with Priya wanting the September variance summary by Tue Oct 20 (exec staff Oct 23). Steel surcharge still on; plan through year end. Owners explained the rest: Bluestem timing, 5.2.0 support overtime, agency fee, harvest overtime. | finds no emails (Gmail on instead of Drive); says the surcharge ends Dec 31. |

---

## Chief of Staff (Executive Office)

| # | Prompt | A good answer… | Wrong if… |
|---|---|---|---|
| CS-1 | What should I raise at the next leadership meeting? | covers exec staff (Fri Oct 23): Kettleridge (85, Critical, $302,000, renews Nov 25); September $216,904 over, steel recurring; six stalled deals ($6,182,000); open field tech and Tier 2 roles. Links them: Connect 5.2.0, thin harvest coverage. | one department only; next steps without owners; figures not in the files. |
| CS-2 | Where are we over budget, and what are we doing about it? | gives September $216,904 over (+7.2%), five lines. Actions: Nick Farrell quoting other steel suppliers; Bluestem reverses in October; support overtime ends after 5.2.1 (Oct 20); field overtime eases when REQ-1043 fills; Owen's summary due Oct 20. | invents savings or a forecast; gives the steel surcharge an end date. |
| CS-3 | Which stalled deals and at-risk customers need my attention this week? | puts Kettleridge first: Bill Strand wants a senior Graywing leader; renewal check-in Tue Oct 20. Then Cinder Creek (OPP-3107, $1,860,000): pricing review Oct 20 without CFO Mark Ellison; 15% discount ask. Then Tallow Bend (58). | misses Kettleridge or Cinder Creek; promises a discount or credit. |

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
