# Recap Email Template

## Structure (follow this order)

1. **Opening** (2 lines)
   - Line 1: Simple, casual thank-you. Vary the wording each time. Examples: "Thank you for attending and participating in this week's squad meeting." / "Thanks for joining and contributing to the session." / "Thank you for showing up and engaging in this week's class."
   - Line 2: What the class focused on (one sentence). Example: "We spoke about [topic], which can include [2–4 concrete examples]." (e.g. "We spoke about backend, which can include spreadsheets, databases, media libraries, automations, and general logic.")

2. **What We Covered** (bold heading)

3. **Topic blocks** (repeat for each educational topic)
   - Blank line before title
   - Underlined topic title: `<u>Topic Name</u>`
   - No vertical space between title and description
   - 1–3 sentence description, ~200 characters max per topic (general principle, not founder-specific)

4. **Recording**
   - Underlined: `<u>Recording</u>`
   - Blank line
   - Plain URL (no markdown link syntax)

5. **Closing**
   - One "central reminder" paragraph synthesizing main takeaway

6. **Sign-off**
   - Cheers
   - Christos
   - Plain LinkedIn URL: https://www.linkedin.com/in/startupchristos

## Format for Gmail

For copy-paste into Gmail, output HTML. Use 11pt Trebuchet MS. **Put the font style on each `<p>` tag** (e.g. `style="font-family: 'Trebuchet MS', sans-serif; font-size: 11pt;"`). Gmail does not reliably cascade styles from a wrapper div to child elements when pasting; inline styles on each element are required.

```html
<p style="font-family: 'Trebuchet MS', sans-serif; font-size: 11pt;">Hello founders,</p>
<p style="font-family: 'Trebuchet MS', sans-serif; font-size: 11pt;">[Line 1: Simple thank-you. Line 2: What the class was about with 2–4 examples.]</p>
<p style="font-family: 'Trebuchet MS', sans-serif; font-size: 11pt;"><strong>What We Covered</strong></p>
<p style="font-family: 'Trebuchet MS', sans-serif; font-size: 11pt;"></p>
<p style="font-family: 'Trebuchet MS', sans-serif; font-size: 11pt;"><u>[Topic Title]</u><br>
[Topic description, ~200 chars max]</p>
<p style="font-family: 'Trebuchet MS', sans-serif; font-size: 11pt;"></p>
<p style="font-family: 'Trebuchet MS', sans-serif; font-size: 11pt;"><u>[Next Topic Title]</u><br>
[Topic description]</p>
<!-- repeat topic blocks; <p></p> before each title, title+description in one <p> with <br>; every <p> gets the font style -->
<p style="font-family: 'Trebuchet MS', sans-serif; font-size: 11pt;"></p>
<p style="font-family: 'Trebuchet MS', sans-serif; font-size: 11pt;"><u>Recording</u><br>
[plain URL]</p>
<p style="font-family: 'Trebuchet MS', sans-serif; font-size: 11pt;">[Central reminder paragraph]</p>
<p style="font-family: 'Trebuchet MS', sans-serif; font-size: 11pt;">Cheers<br>
Christos<br>
https://www.linkedin.com/in/startupchristos</p>
```
