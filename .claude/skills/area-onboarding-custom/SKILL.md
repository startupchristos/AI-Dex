---
name: area-onboarding-custom
description: Onboard an active area (client, startup, program, collaboration, or project) into AI-Dex. Creates a siloed folder with a briefing page and laptop folder link. Use when the user says "create a new area for X", "onboard [activity] into Dex", "add [client/program/project] to my vault", or invokes /area-onboarding.
---

# Area Onboarding

Creates a lightweight, siloed context folder for an active area. The folder is loaded on demand — never auto-loaded into context.

---

## Step 1: Gather Inputs

If the user did not provide all of the following, ask for them together in one message:

```
To create this area I need a few things:

1. Name — what should this area be called? (e.g. "DeliverBack", "Seedstars", "Growth Sprints")
2. Type — which fits best?
   - client / startup (active engagement or advisory)
   - program / collaboration (accelerator, community, partnership, mentoring)
   - product / service (something you sell or deliver)
   - project (time-bound initiative with an end date)
3. Laptop folder — exact path where files live
   (e.g. C:\Users\chris\OneDrive\Documents\PPM Career\Clients & Startups\DeliverBack)
4. Your role — one line (e.g. "Fractional CPO", "Mentor and class instructor", "Advisor")
5. What it is — 1-2 sentences describing the activity
6. Key people (optional) — names and roles, comma-separated
```

Accept inline input too. Example: "Onboard DeliverBack as a client, folder is C:\...\DeliverBack, I'm their fractional advisor" → extract all fields from the sentence.

---

## Step 2: Determine Dex Path

Map the type to the correct Dex subfolder:

| Type | Dex folder |
|---|---|
| client, startup, engagement | `05-Areas/PPM-Career/Clients-and-Startups/<Name>/` |
| program, collaboration, accelerator, community, mentoring | `05-Areas/PPM-Career/Programs-and-Collaborations/<Name>/` |
| product, service | `05-Areas/PPM-Career/Products-and-Services/<Name>/` |
| project (time-bound) | `04-Projects/<Name>/` |

Folder name uses Title-Case-With-Dashes (e.g. `Deliver-Back`, `Farm-Sense`, `Seed-Stars`).

If type is ambiguous, pick the most likely and show your reasoning. The user can correct before you create anything.

---

## Step 3: Preview Before Creating

Show the area card before writing any files:

```
New area ready to create:

Name:          DeliverBack
Type:          Client / Startup
Dex path:      05-Areas/PPM-Career/Clients-and-Startups/DeliverBack/
Laptop folder: C:\Users\chris\OneDrive\Documents\PPM Career\Clients & Startups\DeliverBack
My role:       Fractional Product Advisor
Description:   Last-mile delivery platform for emerging markets. Series A stage.
Key people:    (none provided)

Create it? Say "yes" or correct anything above.
```

Do not create files until the user confirms.

---

## Step 4: Create the Area

Create three things:

**1. The folder:**
```
<vault-root>/05-Areas/PPM-Career/Clients-and-Startups/DeliverBack/
```

**2. `README.md`** — populated from `assets/context-template.md` with all placeholders replaced.

File naming: always `README.md` inside the area folder. This matches the existing pattern (see `05-Areas/PPM-Career/Programs-and-Collaborations/Oneday/README.md`).

**3. `_sources/` subfolder** — write an empty `.gitkeep` file to `<area-folder>/_sources/.gitkeep` to create the folder. This is where client-delivered materials and raw inputs live (documents handed over by the client, transcripts, recordings, rough notes). The main folder stays focused on work product you own and actively maintain.

---

## Step 5: Confirm

```
Area created: DeliverBack

  05-Areas/PPM-Career/Clients-and-Startups/DeliverBack/README.md
  05-Areas/PPM-Career/Clients-and-Startups/DeliverBack/_sources/   ← for client-delivered materials and raw inputs

To activate: say "let's work on DeliverBack" — I will load the consultant
persona and this context, then ask what you are working on.

To update: edit README.md directly or say "update my DeliverBack area".
```

---

## Notes

- This is a custom skill, protected from Dex updates
- For deep active clients (daily work, separate workspace needed), suggest the Cognome model: a dedicated AI-workspace folder with its own CLAUDE.md
- Products-and-Services folder may not exist yet — create it if needed
