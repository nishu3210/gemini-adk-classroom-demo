"""Option 3: Zero-to-One Startup Launch Studio (Search -> Parallel Writers -> Brand Critic)."""
from google.adk.agents import Agent, ParallelAgent, SequentialAgent
from google.adk.tools import google_search

MODEL = "gemini-3.5-flash"

competitor_spy = Agent(
    name="competitor_spy",
    model=MODEL,
    description="Finds competitor positioning via live Google Search.",
    instruction="Search Google for 2 existing competitors to the user's startup idea and summarize their pricing and main hook in 4 crisp lines.",
    tools=[google_search],
    output_key="competitor_brief",
)

insta_writer = Agent(
    name="insta_writer",
    model=MODEL,
    description="Writes a punchy 40-word Gen-Z Instagram Reel hook.",
    instruction=(
        "Using Competitor Brief: {competitor_brief}, write a 40-word Instagram Reel script hook "
        "for Gen-Z Indian college students. Casual, vivid, zero corporate jargon."
    ),
    output_key="insta_draft",
)

linkedin_writer = Agent(
    name="linkedin_writer",
    model=MODEL,
    description="Writes a sharp 70-word founder LinkedIn launch post.",
    instruction=(
        "Using Competitor Brief: {competitor_brief}, write a 70-word LinkedIn launch post "
        "for founders and angel investors. Sharp problem hook + 1 clear CTA."
    ),
    output_key="linkedin_draft",
)

parallel_creators = ParallelAgent(
    name="parallel_creators",
    description="Executes Instagram and LinkedIn writers simultaneously.",
    sub_agents=[insta_writer, linkedin_writer],
)

brand_critic = Agent(
    name="brand_critic",
    model=MODEL,
    description="Audits both drafts, removes AI cliches, and blocks fake claims.",
    instruction=(
        "Review these drafts:\nInstagram: {insta_draft}\nLinkedIn: {linkedin_draft}\n"
        "1. Remove AI clichés ('game-changer', 'delve', 'revolutionize', 'unlock').\n"
        "2. GUARDRAIL: Block any fake government/celebrity endorsements or guaranteed exam-score claims.\n"
        "3. Score each 1-5 on Hook Strength and Clarity, then output the polished final copies."
    ),
)

root_agent = SequentialAgent(
    name="launch_studio_squad",
    description="Competitor Spy -> Parallel Creators (IG + LinkedIn) -> Brand Quality Critic.",
    sub_agents=[competitor_spy, parallel_creators, brand_critic],
)
