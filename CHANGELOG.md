
# Changelog

All notable changes to Dex will be documented in this file.

**For users:** Each entry explains what was frustrating before, what's different now, and why you'll care.

---

## [1.10.10] - 2026-03-11

### career-coach-custom — Protected from Updates

**Before:** Custom career-coach skill (5 modes including Depth/Identity) was in core folder, at risk of overwrite during Dex updates.

**Now:** Migrated to `career-coach-custom/`, protected from `/dex-update`. Invoke with `/career-coach-custom`. Core `career-coach` can receive upstream updates; custom version stays intact.

---

## [1.10.9] - 2026-03-09

### Identity Files and Thinking Skills (PAI-Inspired)

**Before:** No structured place for beliefs, challenges, or wisdom. No formal thinking skills for complex decisions.

**Now:**
- **Identity folder** — `06-Resources/Identity/` with `Beliefs.md`, `Challenges.md`, `Wisdom.md`. Populate over time for context-aware advice.
- **Thinking skills** — `/first-principles-custom` (decompose assumptions, rebuild from fundamentals), `/red-team-custom` (stress-test ideas, find fatal flaws), `/council-custom` (multi-perspective debate).
- **Deep-solve** — `/deep-solve-custom` for structured 7-phase problem-solving (Observe, Think, Plan, Build, Execute, Verify, Learn) on complex, multi-step work.

Skills optionally load Identity files when relevant. CLAUDE.md includes Identity context behavior and updated skills list.

---

## [1.10.8] - 2026-03-07

### Notion Integration (Documents)

**Before:** No way to sync Notion pages to local Markdown or push edits back from Dex.

**Now:** Full Notion integration for document workflows. Hosted MCP (OAuth) at `https://mcp.notion.com/mcp`. Load util-notion before any Notion MCP use. Commands: `util-notion-get-page` (checkout page to `06-Resources/Notion/`), `util-notion-push-page` (push local edits back). Config: `System/notion-config.md`. Agent, skill, format rules, and frontmatter spec added. Documents only; no Cognome or pd-* integration.

---

## [1.10.7] - 2026-03-06

### Cursor Rule — Client Context Switching

New rule `.cursor/rules/client-context-switching.mdc` ensures Cursor loads the right context when you say "let's work on [client]", "switch to [client]", or similar. Loads consultant persona, client README, and optionally project README before responding. Aligns Cursor with CLAUDE.md behavior.

---

## [1.10.6] - 2026-03-06

### util-clean-markdown — Pandoc Underline Spans

`util-clean-markdown` now converts Pandoc underline spans to HTML so they actually render. Before: `[Termination]{.underline}` was ignored by most markdown viewers. After: converted to `<u>Termination</u>`, which renders underlined in Obsidian, VS Code, GitHub, and similar.

---

## [1.10.5] - 2026-03-03

### File Naming — Date Prefix Without Dashes

Date prefixes in filenames now use `YYYYMMDD` (no dashes) instead of `YYYY-MM-DD`. Example: `20260227 - Cognome - Explainer-AI-Kickoff.md` not `2026-02-27 - Cognome - Explainer-AI-Kickoff.md`. Applies to meeting notes, structured docs, career evidence, job search results, and similar dated files. Content dates (metadata, due dates) remain `YYYY-MM-DD` (ISO). Updated file-naming rule, CLAUDE.md, AI-workspace meetings convention, structure-notes skill, and career-coach templates.

---

## [1.10.4] - 2026-03-03

### Oneday Class Recap Generator — HTML Font Styling

HTML recap output uses 11pt Trebuchet MS. Font style must be on each `<p>` tag (not a wrapper div). Gmail does not cascade parent styles to children when pasting HTML; inline styles on each element are required for font preservation.

---

## [1.10.3] - 2026-03-03

### Oneday Class Recap Generator

New custom skill `/oneday-class-recap-generator-custom` generates post-class recap emails for Oneday participants. Input: transcript URL (or pasted transcript) and recording URL. Extracts educational content (upskilling, general startup advice, feedback) and excludes proprietary founder-specific progress. Output follows sample recap format (.md and optional .html for Gmail paste).

---

## [1.10.2] - 2026-03-03

### Programs-and-Collaborations / Oneday

Added `05-Areas/PPM-Career/Programs-and-Collaborations/` with Oneday subfolder for mentoring founders and teaching classes. Updated CLAUDE.md, PPM Career README, and pillars.yaml so tasks about Oneday, mentoring, or teaching route to PPM Career.

---

## [1.10.1] - 2026-02-27

### Email Writing Guidelines

**Before:** No standard rules for drafting emails to team, partners, or business contacts. Each draft was ad hoc.

**Now:** Email drafting guidelines live in `06-Resources/Reference - Email-Writing-Guidelines.md`. When you ask Dex for an email draft, it loads and applies structure, tone, formatting, and validation rules automatically. A Cursor rule (`.cursor/rules/email-writing.mdc`) is available for manual inclusion when drafting in the editor.

---

## [1.10.0] - 2026-02-17

### 🩺 Dex Now Tells You When Something's Wrong

**Before:** When something failed — your calendar couldn't connect, a task couldn't be created, meeting processing hit an error — you'd get a vague message in the conversation and then... nothing. The error disappeared when the chat ended. If something was quietly broken for days, you wouldn't know until you needed it and wondered why it stopped working.

**Now:** Dex watches its own health. Every tool across all 12 background services captures failures the moment they happen — in plain language, not technical jargon. The next time you start a conversation, you'll see anything that went wrong:

```
--- ⚠️ Recent Errors (2) ---
  [Task Manager] Feb 17 09:30 — Task creation failed (×3)
  [Calendar] Feb 16 14:00 — Calendar couldn't connect
Say: 'health check' to investigate
---
```

If everything is fine? Complete silence. No "all systems go" noise.

**Say `/health-check` anytime** to get a full diagnostic: which services are running, what's failed recently, and — for most issues — a suggested fix. Missing something? It tells you the exact command. Config issue? It offers to repair it.

**What this means for you:** Instead of discovering something's been broken for a week, you find out at your next conversation. Instead of a cryptic error, you get "Calendar couldn't connect" with a clear next step. Dex is becoming the kind of system that takes care of itself — and tells you when it needs your help.

**Platform note:** Automatic startup checks work in Claude Code. In Cursor, the error capture still works behind the scenes — just run `/health-check` manually to see the same diagnostic.

---

## [1.9.1] - 2026-02-17

### Automatic Update Notifications

Previously, you had to remember to run `/dex-update` to check for new versions. Now Dex checks once a day automatically and lets you know if there's something new — a quiet one-liner at the end of your first chat, once per day. No nagging, no blocking. Run `/dex-update` when you're ready, or ignore it.

---

## [1.9.0] - 2026-02-17

### 🔍 Optional: Smarter Search for Growing Vaults

You might be thinking: "Dex already uses AI — doesn't it search intelligently?" Good question. Here's what's actually happening under the hood.

When you ask Dex something like "what do I know about customer retention?", two things happen:

1. **Finding the files** — Dex searches your vault for relevant notes
2. **Making sense of them** — Claude reads those notes and gives you a smart answer

Step 2 has always been intelligent — that's Claude doing what it does best. But Step 1? Until now, that's been basic keyword matching. Dex literally searches for the word "retention" in your files. If you wrote about the same topic using different words — "churn", "users leaving", "cancellation patterns" — those notes never made it to Claude's desk. It can't reason about things it never sees.

**That's what semantic search fixes.** It upgrades Step 1 — the finding — so the right notes reach Claude even when the words don't match.

It's also significantly faster and lighter. Instead of Claude reading entire files to find what's relevant (thousands of tokens each), the search engine returns just the relevant snippets. One developer measured a 96% reduction in the amount of context needed per search.

**When does this matter?** Honestly, if your vault has fewer than 50 notes, keyword matching works fine. As your vault grows into the hundreds of files, keyword search starts missing things — and that's where this upgrade earns its keep.

---

This is powered by [QMD](https://github.com/tobi/qmd), an open-source local search engine created by Tobi Lütke (founder and CEO of Shopify). Everything runs on your machine — no data leaves your computer.

> "I think QMD is one of my finest tools. I use it every day because it's the foundation of all the other tools I build for myself. A local search engine that lives and executes entirely on your computer. Both for you and agents." — [Tobi Lütke](https://x.com/tobi/status/2013217570912919575)

**This is optional.** It requires downloading AI models (~2GB) that run locally on your machine. No API keys, no cloud services. Run `/enable-semantic-search` when you're ready — or skip it entirely.

**What gets better when you enable it:**

- **Planning & Reviews** — `/daily-plan`, `/week-plan`, `/daily-review`, `/week-review`, and `/quarter-review` all become meaning-aware. Your morning plan surfaces notes related to today's meetings by theme ("onboarding" pulls in "activation rates"). Your weekly review detects which tasks contributed to which goals — even when they weren't explicitly linked. Stale goals get flagged with hidden activity you didn't know about.

- **Meeting Intelligence** — `/meeting-prep` finds past discussions related to the meeting topic, not just meetings with the same people. `/process-meetings` catches implicit commitments like "we should circle back on pricing" — soft language that keyword extraction misses.

- **Search & People** — All vault searches become meaning-aware. Person lookup finds references by role ("the VP of Sales asked about..."), not just by name.

- **Smarter Dedup** — Task creation detects semantic duplicates ("Review Q1 metrics" matches "Check quarterly pipeline numbers"). Same for improvement ideas in your backlog.

- **Natural Task Completion** — Say "I finished the pricing thing" and Dex matches it to the right task, even when your words don't match the title exactly.

- **Career Tracking** — If you use the career system, skill demonstration is now detected without explicit `# Career:` tags. "Designed the API migration strategy" automatically matches your "System Design" competency.

**If you don't enable it,** nothing changes — everything continues to work with keyword matching, just as it always has.

Part of our philosophy with Dex is to stay on top of the best open-source tools so you don't have to. When something like QMD comes along that genuinely makes the experience better, we integrate it — you run one command and your existing workflows get smarter.

**Smart setup, not generic indexing.** When you run `/enable-semantic-search`, Dex scans your vault and recommends purpose-built search collections based on what you've actually built — people pages, meeting notes, projects, goals. Each collection gets semantic context that tells the search engine what the content IS, dramatically improving result relevance. Generic tools dump everything into one index. Dex gives your search engine a mental model of your information architecture.

As your vault grows, Dex notices. Created your first few company pages? Next time you run `/daily-plan`, it'll suggest: "You've got enough accounts for a dedicated collection now — want me to create one?" Your search setup evolves with your vault.

**To enable:** `/enable-semantic-search` (one-time setup, ~5 minutes)

---

## [1.8.0] - 2026-02-16

### 📊 Your Usage Now Shapes What Gets Built Next

**Before:** If you opted in to help improve Dex, your anonymous usage data wasn't being captured consistently across all features. Some areas were tracked, others weren't — so the picture of which features people find most valuable was incomplete.

**Now:** Every Dex feature — all 30 skills and 6 background services — now reports usage when you've opted in. You'll also notice the opt-in prompt appears at the start of each session (instead of only during planning), so you won't miss it. Say "yes" or "no" once and it's settled — if you're not ready to decide, it'll gently ask again next time.

When you run `/dex-update`, any new features automatically appear in your usage log without losing your existing data. And as new capabilities ship in the future, they'll always include tracking from day one.

**Result:** If you've opted in, you're directly influencing which features get priority. The most-used capabilities get more investment — your usage data is the signal.

---

## [1.7.0] - 2026-02-16

### ✨ Smoother Onboarding — Clickable Choices & Cross-Platform Support

**Before:** During setup, picking your role meant scrolling through a wall of 31 numbered options and typing a number. If your Mac's Calendar app was running in the background (but not in the foreground), Dex couldn't detect your calendars — silently skipping calendar optimization. And if you onboarded in Cursor vs Claude Code, the question prompts might not work because each platform has a different tool for presenting clickable options.

**Now:** Role selection, company size, and other choices are presented as clickable lists — just pick from the menu. Dex detects your platform once at the start (Cursor vs Claude Code vs terminal) and uses the right question tool throughout. Calendar detection works regardless of whether Calendar.app is in the foreground or background. QA testing uses dry-run mode so nothing gets overwritten.

**Result:** Onboarding feels polished — fewer things to type, fewer silent failures, works correctly whether you're in Cursor or Claude Code.

---

## [1.6.0] - 2026-02-16

### ✨ Dex Now Discovers Its Own Improvements

**Before:** When new Claude Code features shipped or you had ideas for how Dex could work better, it was up to you to remember them and add them to your backlog. Keeping track of what could be improved meant extra manual work.

**Now:** Dex watches for opportunities to get better and weaves them into your existing routines:

- `/dex-whats-new` spots relevant Claude Code releases and turns them into improvement ideas in your backlog
- `/daily-plan` highlights the most timely idea as an "Innovation Spotlight" when something new is relevant (e.g., "Claude just shipped native memory — here's how that could help")
- `/daily-review` connects today's frustrations to ideas already in your backlog
- `/week-review` shows your top 3 highest-scored improvement ideas
- Say "I wish Dex could..." in conversation and it's captured automatically — no duplicates

**Result:** Your improvement backlog fills itself. Ideas arrive from AI discoveries and your own conversations, get ranked by impact, and surface at the right moment during planning and reviews.

---

## [1.5.0] - 2026-02-15

### 🔧 All Your Granola Meetings Now Show Up

**Before:** Some meetings recorded on mobile or edited in Granola's built-in editor wouldn't appear in Dex — they'd be invisible during meeting prep and search.

**Now:** Dex handles all the ways Granola stores your notes, so every meeting comes through — regardless of how or where you recorded it.

**Result:** If Granola has your notes, Dex will find them. No meetings slip through the cracks.

---

## [1.4.0] - 2026-02-15

### 🔧 Dex Now Always Knows What Day It Is

**Before:** Dex relied entirely on the host platform (Cursor, Claude Code) to tell Claude the current date. If the platform didn't surface it prominently, Claude could lose track of what day it was — especially frustrating during daily planning or scheduling conversations.

**Now:** The session-start hook explicitly outputs today's date at the very top of every session context injection, so it's front-and-center regardless of platform behavior.

**Result:** No more "what day is it?" confusion. Dex always knows the date, every session, every platform.

---

## [1.3.0] - 2026-02-05

### 🎯 Smart Pillar Inference for Task Creation

**What was frustrating:** Every time you asked to create a task ("Remind me to prep for the Acme demo"), Dex would stop and ask: "Which pillar is this for?" This added friction to quick captures and broke your flow.

**What's different now:** Dex analyzes your request and infers the most likely pillar based on keywords:
- "Prep demo for Acme Corp" → **Deal Support** (demo + customer keywords)
- "Write blog post about AI" → **Thought Leadership** (content keywords)
- "Review beta feedback" → **Product Feedback** (feedback keywords)

Then confirms with a quick one-liner:
> "Creating under Product Feedback pillar (looks like data gathering). Sound right, or should it be Deal Support / Thought Leadership?"

**Why you'll care:** Fast task capture with data quality. No more back-and-forth just to add a reminder. But your tasks still have proper strategic alignment.

**Customization options:** Want different behavior? You can customize this in your CLAUDE.md:
- **Less strict:** Remove the pillar requirement entirely and use a default pillar
- **Triage flow:** Route quick captures to `00-Inbox/Quick_Captures.md`, then sort them during `/triage` (skill you can build yourself or request)
- **Your own keywords:** Edit `System/pillars.yaml` to add custom keywords for better inference

**Technical:** Updated task creation behavior in `.claude/CLAUDE.md` to include pillar inference logic. The work-mcp validation still requires a pillar (maintains data integrity), but Dex now handles the inference and confirmation before calling the MCP.

---

### ⚡ Calendar Queries Are Now 30x Faster (30s → <1s)

**Before:** Asking "what meetings do I have today?" meant waiting up to 30 seconds for a response. Old events from weeks ago sometimes appeared in today's results too.

**Now:** Calendar queries respond in under a second and only show events for the dates you asked about. No more waiting, no more ghost events.

**One-time setup:** After updating, run `/calendar-setup` to grant calendar access. This unlocks the faster queries. If you skip this step, everything still works — just slower.

---

### 🐛 Paths Now Work on Any Machine

**Before:** A few features — Obsidian integration and background automations — didn't work correctly on some setups.

**Now:** All paths resolve dynamically based on where your vault lives. Everything works regardless of your username or folder structure.

**How to update:** In Cursor, just type `/dex-update` — that's it!

**Thank you** to the community members who reported this. Your feedback makes Dex better for everyone.

---

### 🔬 X-Ray Vision: Learn AI by Seeing What Just Happened

**What was frustrating:** Dex felt like a black box. You knew it was helping, but you had no idea what was actually happening — which tools were firing, how context was loaded, or how you could customize the system. Learning AI concepts felt abstract and disconnected from your actual experience.

**What's new:** Run `/xray` anytime to understand what just happened in your conversation.

**Default mode (just `/xray`):** Shows the work from THIS conversation:
- What files were read and why
- What tools/MCPs were used
- What context was loaded at session start (and how)
- How each action connects to underlying AI concepts

**Deep-dive modes:**
- `/xray ai` — First principles: context windows, tokens, statelessness, tools
- `/xray dex` — The architecture: CLAUDE.md, hooks, MCPs, skills, vault structure
- `/xray boot` — The session startup sequence in detail
- `/xray today` — ScreenPipe-powered analysis of your day
- `/xray extend` — How to customize: edit CLAUDE.md, create skills, write hooks, build MCPs

**The philosophy:** The best way to learn AI is by examining what just happened, not reading abstract explanations. Every `/xray` session connects specific actions (I read this file because...) to general concepts (...CLAUDE.md tells me where files live).

**Where you'll see it:**
- Run `/xray` after any conversation to see "behind the scenes"
- Educational concepts are tied to YOUR vault and YOUR actions
- End with practical customization opportunities

**The goal:** You're not just a user — you're empowered to extend and personalize your AI system because you understand the underlying mechanics.

---

### 🔌 Productivity Stack Integrations (Notion, Slack, Google Workspace)

**What was frustrating:** Your work context is scattered across Notion, Slack, and Gmail. When prepping for meetings, you manually search each tool. When looking up a person, you don't see your communication history with them.

**What's new:** Connect your productivity tools to Dex for richer context everywhere:

1. **Notion Integration** (`/integrate-notion`)
   - Search your Notion workspace from Dex
   - Meeting prep pulls relevant Notion docs
   - Person pages link to shared Notion content
   - Uses official Notion MCP (`@notionhq/notion-mcp-server`)

2. **Slack Integration** (`/integrate-slack`)
   - "What did Sarah say about the Q1 budget?" → Searches Slack
   - Meeting prep includes recent Slack context with attendees
   - Person pages show communication history
   - Easy cookie auth (no bot setup required) or traditional bot tokens

3. **Google Workspace Integration** (`/integrate-google`)
   - Gmail thread context in person pages
   - Email threads with meeting attendees during prep
   - Calendar event enrichment
   - One-time OAuth setup (~5 min)

**Where you'll see it:**
- `/meeting-prep` — Pulls context from all enabled integrations
- Person pages — Integration Context section with Slack/Notion/Email history
- New users — Onboarding Step 9 offers integration setup
- Existing users — `/dex-update` announces new integrations, detects your existing MCPs

**Smart detection for existing users:**
If you already have Notion/Slack/Google MCPs configured, Dex detects them and offers to:
- Keep your existing setup (it works!)
- Upgrade to Dex recommended packages (better maintained, more features)
- Skip and configure later

**Setup commands:**
- `/integrate-notion` — 2 min setup (just needs a token)
- `/integrate-slack` — 3 min setup (cookie auth or bot token)
- `/integrate-google` — 5 min setup (OAuth through Google Cloud)

---

### 🔔 Ambient Commitment Detection (ScreenPipe Integration) [BETA]

**What was frustrating:** You say "I'll send that over" in Slack or get asked "Can you review this?" in email. These micro-commitments don't become tasks — they fall through the cracks until someone follows up (awkward) or they're forgotten (worse).

**What's new:** Dex now detects uncommitted asks and promises from your screen activity:

1. **Commitment Detection** — Scans apps like Slack, Email, Teams for commitment patterns
   - Inbound asks: "Can you review...", "Need your input...", "@you"
   - Outbound promises: "I'll send...", "Let me follow up...", "Sure, I'll..."
   - Deadline extraction: "by Friday", "by EOD", "ASAP", "tomorrow"

2. **Smart Matching** — Connects commitments to your existing context
   - Matches people mentioned to your People pages
   - Matches topics to your Projects
   - Matches keywords to your Goals

3. **Review Integration** — Surfaces during your rituals
   - `/daily-review` shows today's uncommitted items
   - `/week-review` shows commitment health stats
   - `/commitment-scan` for standalone scanning anytime

**Example during daily review:**
```
🔔 Uncommitted Items Detected

1. Sarah Chen (Slack, 2:34 PM)
   > "Can you review the pricing proposal by Friday?"
   📎 Matches: Q1 Pricing Project
   → [Create task] [Already handled] [Ignore]
```

**Privacy-first:**
- Requires ScreenPipe running locally (all data stays on your machine)
- Sensitive apps excluded by default (1Password, banking, etc.)
- You decide what becomes a task — nothing auto-created

**Beta activation required:**
- Run `/beta-activate DEXSCREENPIPE2026` to unlock ScreenPipe features
- Then asked once during `/daily-plan` or `/daily-review` to enable
- Must explicitly enable before any screen data is accessed
- New users can also run `/screenpipe-setup` after beta activation

**New skills:**
- `/commitment-scan` — Scan for uncommitted items anytime
- `/screenpipe-setup` — Enable/disable ScreenPipe with privacy configuration

**Why you'll care:** Never forget a promise or miss an ask again. The things you commit to in chat apps now surface in your task system automatically.

**Requirements:** ScreenPipe must be installed and opted-in. See `06-Resources/Dex_System/ScreenPipe_Setup.md` for setup.

---

### 🤖 AI Model Flexibility: Budget Cloud & Offline Mode

**What was frustrating:** Dex only worked with Claude, which costs money and requires internet. Heavy users faced high API bills, and travelers couldn't use Dex on planes or trains.

**What's new:** Two new ways to use Dex:

1. **Budget Cloud Mode** — Use cheaper AI models like Kimi K2.5 or DeepSeek when online
   - Save 80-97% on API costs for routine tasks
   - Requires ~$5-10 upfront via OpenRouter
   - Quality is great for daily tasks (summaries, planning, task management)

2. **Offline Mode** — Download an AI to run locally on your computer
   - Works on planes, trains, anywhere without internet
   - Completely free forever
   - Requires 8GB+ RAM (16GB+ recommended)

3. **Smart Routing** — Let Dex automatically pick the best model
   - Claude for complex tasks
   - Budget models for simple tasks
   - Local model when offline

**New skills:**
- `/ai-setup` — Guided setup for budget cloud and offline mode
- `/ai-status` — Check your AI configuration and credits

**Why you'll care:** Reduce your AI costs by 80%+ for everyday tasks, or work completely offline during travel — your choice.

**User-friendly:** The setup is fully guided with plain-language explanations. Dex handles the technical parts (starting services, downloading models) automatically.

---

### 📊 Help Dave Improve Dex (Optional Analytics)

**What's this about?**

Dave could use your help making Dex better. This release adds optional, privacy-first analytics that lets you share which Dex features you use — not what you do with them, just that you used them.

**What gets tracked (if you opt in):**
- Which Dex built-in features you use (e.g., "ran /daily-plan")
- Nothing about what you DO with features
- No content, names, notes, or conversations — ever

**What's NOT tracked:**
- Custom skills or MCPs you create
- Any content you write or manage
- Who you meet with or what you discuss

**The ask:**

During onboarding (new users) or your next planning session (existing users), Dex will ask once:

> "Dave could use your help improving Dex. Help improve Dex? [Yes, happy to help] / [No thanks]"

Say yes, and you help Dave understand which features work and which need improvement. Say no, and nothing changes — Dex works exactly the same.

**Technical:**
- Added `analytics_helper.py` in `core/mcp/`
- Consent tracked in `System/usage_log.md`
- Events only fire if `analytics.enabled: true` in user-profile.yaml
- 20+ skills now have analytics hooks

**Beta only:** This feature is currently in beta testing.

---

## [1.2.0] - 2026-02-03

### 🧠 Planning Intelligence: Your System Now Thinks Ahead

**What's this about?**

Until now, daily and weekly planning showed you information — your tasks, calendar, priorities. But you had to connect the dots yourself. 

Now Dex actively thinks ahead and surfaces things you might have missed.

This is the biggest upgrade to Dex's intelligence since launch. Based on feedback from early users, we've rebuilt the planning skills to be proactive rather than passive. Dex now does the mental work of connecting your calendar to your tasks, tracking your commitments, and warning you when things are slipping — so you can focus on actually doing the work.

---

**Midweek Awareness**

**Before:** You'd set weekly priorities on Monday, then forget about them until Friday's review. By then it's too late — Priority 3 never got touched.

**Now:** When you run `/daily-plan` midweek, Dex knows where you stand:

> "It's Wednesday. You've completed 1 of 3 weekly priorities. Priority 2 is in progress (2 of 5 tasks done). Priority 3 hasn't been touched yet — you have 2 days left."

**Result:** Course-correct while there's still time. No more end-of-week surprises.

---

**Meeting Intelligence**

**Before:** You'd see "Acme call" on your calendar and have to manually check: what's the status of that project? Any outstanding tasks? What did we discuss last time?

**Now:** For each meeting, Dex automatically connects the dots:

> "You have the Acme call Thursday. Looking at that project: the proposal is still in draft, and you owe Sarah the pricing section. Want to block time for prep?"

**Result:** Walk into every meeting prepared. Related tasks and project status surface automatically.

---

**Commitment Tracking**

**Before:** You'd say "I'll get back to you Wednesday" in a meeting, write it in your notes... and forget. It lived in a meeting note you never looked at again.

**Now:** Dex scans your meeting notes for things you said you'd do:

> "You told Mike you'd get back to him by Wednesday. That's today."

**Result:** Keep your promises. Nothing slips through because it was buried in notes.

---

**Smart Scheduling**

**Before:** All tasks were equal. A 3-hour strategy doc and a 5-minute email sat on the same list with no guidance on when to tackle them.

**Now:** Dex classifies tasks by effort and matches them to your calendar:

> "You have a 3-hour block Wednesday morning — perfect for 'Write Q1 strategy doc' (deep work). Thursday is stacked with meetings — good for quick tasks only."

It even warns you when you have more deep work than available focus time.

**Result:** Stop fighting your calendar. Know which tasks fit which days.

---

**Intelligent Priority Suggestions**

**Before:** `/week-plan` asked "What are your priorities?" and waited. You had to figure it out yourself.

**Now:** Dex suggests priorities based on your goals, task backlog, and calendar shape:

> "Based on your goals, tasks, and calendar, I suggest:
> 1. Complete pricing proposal — Goal 1 needs this for milestone 3
> 2. Customer interviews — Goal 2 hasn't had activity in 3 weeks
> 3. Follow up on Acme — You committed to Sarah by Friday"

You still decide. But now you have a thinking partner who's done the analysis.

**Result:** Start each week with intelligent suggestions, not a blank page.

---

**Concrete Progress (Not Fake Percentages)**

**Before:** "Goal X is at 55%." What does that even mean? Percentages feel precise but communicate nothing.

**Now:** "Goal X: 3 of 5 milestones complete. This week you finished the pricing page and scheduled the customer interviews."

**Result:** Weekly reviews that actually show what you accomplished and what's left.

---

**How it works (under the hood):**

Six new capabilities power the intelligence:

| What Dex can now do | Why it matters |
|---------------------|----------------|
| Check your week's progress | Knows which priorities are on track vs slipping |
| Understand meeting context | Connects each meeting to related projects and people |
| Find your commitments | Scans notes for promises you made and when they're due |
| Judge task effort | Knows a strategy doc needs focus time, an email doesn't |
| Read your calendar shape | Sees which days have deep work time vs meeting chaos |
| Match tasks to time | Suggests what to work on based on available blocks |

**What to try:**

- Run `/daily-plan` on a Wednesday — see midweek awareness in action
- Check `/week-plan` — get intelligent priority suggestions instead of a blank page
- Before a big meeting, run `/meeting-prep` — watch it pull together everything relevant

---

## [1.1.0] - 2026-02-03

### 🎉 Personalize Dex Without Losing Your Changes

**What's this about?**

Many of you have been making Dex your own — adding personal instructions, connecting your own tools like Gmail or Notion, tweaking how things work. That's exactly what Dex is designed for.

But until now, there was a tension: when I release updates to Dex with new features and improvements, your personal changes could get overwritten. Some people avoided updating to protect their setup. Others updated and had to redo their customizations.

This release fixes that. Your personalizations and my updates now work together.

---

**What stays protected:**

**Your personal instructions**

If you've added notes to yourself in the CLAUDE.md file — reminders about how you like things done, specific workflows, preferences — those are now protected. Put them between the clearly marked `USER_EXTENSIONS` section, and they'll never be touched by updates.

**Your connected tools**

If you've connected Dex to other apps (like your email, calendar, or note-taking tools), those connections are now protected too. When you add a tool, Dex automatically names it in a way that keeps it safe from updates.

**New command: `/dex-add-mcp`** — When you want to connect a new tool, just run this command. It handles the technical bits and makes sure your connection is protected. No config files to edit.

---

**What happens when there's a conflict?**

Sometimes my updates will change a file that you've also changed. When that happens, Dex now guides you through it with simple choices:

- **"Keep my version"** — Your changes stay, skip this part of the update
- **"Use the new version"** — Take the update, replace your changes
- **"Keep both"** — Dex will keep both versions so nothing is lost

No technical knowledge needed. Dex explains what changed and why, then you decide.

---

**Why this matters**

I want you to make Dex truly yours. And I want to keep improving it with new features you'll find useful. Now both can happen. Update whenever you like, knowing your personal setup is safe.

---

### 🔄 Background Meeting Sync (Granola Users)

**Before:** To get your Granola meetings into Dex, you had to manually run `/process-meetings`. Each time, you'd wait for it to process, then continue your work. Easy to forget, tedious when you remembered.

**Now:** A background job syncs your meetings from Granola every 30 minutes automatically. One-time setup, then it just runs.

**To enable:** Run `.scripts/meeting-intel/install-automation.sh`

**Result:** Your meeting notes are always current. When you run `/daily-plan` or look up a person, their recent meetings are already there — no manual step needed.

---

### ✨ Prompt Improvement Works Everywhere

**Before:** The `/prompt-improver` command required extra configuration. In some setups, it just didn't work.

**Now:** It automatically uses whatever AI is available — no special configuration needed.

**Result:** Prompt improvement just works, regardless of your setup.

---

### 🚀 Easier First-Time Setup

**Before:** New users sometimes hit confusing error messages during setup, with no clear guidance on what to do next.

**Now:**
- Clear error messages explain exactly what's wrong and how to fix it
- Requirements are checked upfront with step-by-step instructions
- Fewer manual steps to get everything working

**Result:** New users get up and running faster with less frustration.

---

## [1.0.0] - 2026-01-25

### 📦 Initial Release

Dex is your AI-powered personal knowledge system. It helps you organize your professional life — meetings, projects, people, ideas, and tasks — with an AI assistant that learns how you work.

**Core features:**
- **Daily planning** (`/daily-plan`) — Start each day with clear priorities
- **Meeting capture** — Extract action items, update person pages automatically
- **Task management** — Track what matters with smart prioritization
- **Person pages** — Remember context about everyone you work with
- **Project tracking** — Keep initiatives moving forward
- **Weekly and quarterly reviews** — Reflect and improve systematically

**Requires:** Cursor IDE with Claude, Python 3.10+, Node.js
