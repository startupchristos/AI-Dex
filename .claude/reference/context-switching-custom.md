# Context Switching — Router

Loaded on demand when the user says "let's work on X", "switch to X", "I want to work on X", or similar.

Match X against the named contexts below **in order**. Use the first match.

---

## Named Contexts

### Life Coaching / Life Design
**Matches:** "Life Coaching", "Life Coach", "life-coach", "Life Design", "life design", or similar

1. Load `05-Areas/Body-Mind-Spirit/Life-Design/README.md` for current status
2. Confirm: "In Life Design mode. [One sentence on current focus from the README.]"
3. Ask: "What are we working on?"
4. Invoke the `/life-coach-custom` skill
5. Stop here -- do not continue below

---

### Update from Christos
**Matches:** "Update from Christos", "newsletter", "update newsletter", "my update", or similar

1. Invoke the `/update-from-christos-custom` skill
2. Stop here -- do not continue below

---

### Career Advice / Coaching
**Matches:** "Career", "Career Advice", "Career Coaching", "career coach", "my career", or similar (when not invoking the `/career-coach` skill directly)

1. Load all four files in `05-Areas/PPM-Career/Identity-and-Positioning/`:
   - `README.md` — area overview and current status
   - `Professional-Identity-Blueprint.md` — core positioning, narrative, differentiators
   - `Positioning-and-Targets.md` — target roles, companies, and market positioning
   - `Career-Coaching-Profile.md` — coaching context, goals, blockers, development areas
2. Confirm: "In Career mode. [One sentence on current focus from the README.]"
3. Ask: "What are we working on?"
4. Stop here -- do not continue below

---

### Business Acquisition
**Matches:** "Business Acquisition", "acquisition", "buying a business", "biz acq", or similar

1. Load `05-Areas/Side-Ventures/Business-Acquisition/README.md` — overview, current status, active prospects
2. If a specific prospect is mentioned, also load the matching file from `05-Areas/Side-Ventures/Business-Acquisition/_prospects/`
3. Confirm: "In Business Acquisition mode. [One sentence on current status from the README.]"
4. Ask: "What are we working on?"
5. Stop here -- do not continue below

---

### Startup Consulting (no specific client)
**Matches:** "Startup Consulting", "consulting mode", "consultant mode", "my consulting", or similar (no specific client name given)

1. Load `05-Areas/PPM-Career/Clients-and-Startups/Reference - Startup-Consultant-Persona.md` — shared consultant role context, positioning, approach
2. Confirm: "In Startup Consulting mode. Operating as fractional CPO and startup consultant."
3. Ask: "What are we working on?"
4. Stop here -- do not continue below

---

### Cognome
**Matches:** "Cognome", "Cognome [project]", "Cognome [product]"

1. Read `C:\Users\chris\OneDrive\Documents\PPM Career\Clients & Startups\Cognome\AI-workspace\CLAUDE.md`
2. Follow the Context Switching procedure defined in that file, using the specified project or product as the target
3. Stop here -- Cognome's CLAUDE.md takes over from here

---

### Any other client or project
*(No match above)*

1. Load `05-Areas/PPM-Career/Clients-and-Startups/Reference - Startup-Consultant-Persona.md` (shared consultant role context)
2. Load the client briefing:
   - Folder-based client: `05-Areas/PPM-Career/Clients-and-Startups/[Client]/README.md`
   - File-based client: `05-Areas/PPM-Career/Clients-and-Startups/[Client].md`
3. If a project is specified (e.g., "let's work on RevItUp / Growth Sprint"), also load: `05-Areas/PPM-Career/Clients-and-Startups/[Client]/[Project]/README.md`
4. Respond with a brief confirmation: "In [Client] mode. [One sentence summary of current status from the README.]"
5. Then ask: "What are we working on?"
6. If no match found in the Dex vault, check Cognome's workspace as a fallback:
   - `C:\Users\chris\OneDrive\Documents\PPM Career\Clients & Startups\Cognome\AI-workspace\projects\[X]\` -- client project
   - `C:\Users\chris\OneDrive\Documents\PPM Career\Clients & Startups\Cognome\AI-workspace\product-mgmt\[X]\` -- internal product
   - If found in either, treat as "Cognome [X]": read Cognome's CLAUDE.md and follow its Context Switching procedure
7. If not found anywhere, say so and offer to create one

---

## Rules (all contexts)

- Do not announce which files you loaded -- just confirm the mode and status
- To add a new named context: add a new `###` section above "Any other client or project"
- Named contexts that load a README expect a `## Current Status` section. See CLAUDE.md → Area README Standard for the required format.
