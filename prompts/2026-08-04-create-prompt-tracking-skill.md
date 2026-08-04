# Create prompt-tracking skill

Date: 2026-08-04

## Prompt

[$skill-creator](/Users/trevorbroaddus/.codex/skills/.system/skill-creator/SKILL.md) Lets create a skill for tracking the prompts that I send for this particular project healthie_tech_interview. Please include *this* prompt in that archive. I've already created a `/prompts` directory at the root of the project and have added my "genesis" prompt that I used. Please use that directory going forward. We should log the prompt and a short summary of any impcated files from the prompt and prose about the changes. Make this in the `/Users/trevorbroaddus/Documents/Projects/healthie_tech_interview/.agents` directory please.

## Impacted files

- `.agents/skills/track-project-prompts/SKILL.md`: Defines the project-specific prompt archival workflow and safety boundaries.
- `.agents/skills/track-project-prompts/agents/openai.yaml`: Supplies the skill's user-facing name, description, and default invocation prompt.
- `prompts/2026-08-04-create-prompt-tracking-skill.md`: Archives this request and its resulting impact summary.

## Changes

Created a project-local skill that records implementation prompts verbatim in `prompts/`, then adds an evidence-based list of affected files and a prose summary after the requested work is complete. The workflow preserves the existing `prompts/genesis.md`, avoids conflating unrelated working-tree changes with the current prompt, and requires sensitive values to be redacted rather than archived.
