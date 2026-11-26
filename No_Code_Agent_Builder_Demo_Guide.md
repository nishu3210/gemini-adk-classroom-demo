# No-Code Visual Agent Builder — Live 4-Minute Classroom Demo Guide

You have **two ultra-clean options** to show a real No-Code Visual Agent Builder live on stage so students see an actual pipeline/graph (unlike a single-box Gemini Gem/Skill).

---

## Option A (Recommended · Already Open!): Google ADK Built-In Visual Builder
**Cost:** ₹0 (uses your same free Gemini key) · **Zero extra logins!**

### Exact 4-Minute Stage Script:
1. Inside `http://localhost:8000` (`adk web`), click the **`+` (plus)** button next to the agent dropdown at the top-left.
2. Name the app: `campus_pitch_helper` → click **Create**.
3. Point to the 3 panels on the projector:
   - **Center Canvas:** Live visual node graph of your agents & tools.
   - **Left Panel:** Clean form fields (Model, Instructions, Tools, Callbacks) — zero YAML syntax!
   - **Right Panel (The Wow Moment):** Built-in **Gemini Agent Builder Assistant**!
4. Type this plain-English prompt into the **Right Panel Assistant**:
   > *"Build a Sequential multi-agent workflow with two sub-agents: 1) `rival_finder` using Google Search to find 2 Indian competitors for any startup idea, and 2) `pitch_coach` that writes a 3-bullet investor pitch avoiding those rivals' weaknesses."*
5. Watch the visual graph build itself live on screen! Click **Save**, test it with one student's idea, and switch to the **Trace Tab** to show the exact execution timeline!

---

## Option B (Zero-Terminal Cloud Alternative): Gumloop (`gumloop.com`)
**Best if you want to show a pure browser SaaS no-code canvas students can sign up for in 30 seconds.**
- **Free tier:** 1,000–2,000 credits/month (Google sign-in, no credit card).
- **3-Minute Live Build on Projector:**
  1. Click **New Flow** → drag **Input** node ("Startup Idea").
  2. Connect to **Web Search** node (finds 3 Indian competitors).
  3. Connect to **Ask AI** node (Gemini / Claude) with your Shark Tank or Launch Studio rubric.
  4. Connect to **Output** node (or Gmail/Slack) and click **Run** — students visually watch green checkmarks light up node-by-node across the canvas!
- **Great talking point:** *"Gumloop / Make / n8n are awesome for visual no-code workflows (Tier 2). Google ADK gives you BOTH a visual builder AND full engineering traces + automated Evals (Tier 2 → Tier 3)."*
