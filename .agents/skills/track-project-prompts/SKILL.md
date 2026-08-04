---
name: track-project-prompts
description: Archive user prompts for the healthie_tech_interview project and document the files and changes caused by each prompt. Use for every implementation or project-changing request in this repository, including requests to create, edit, delete, configure, generate, or reorganize project files, and whenever the user explicitly asks to record or archive a prompt.
---

# Track Project Prompts

Maintain a durable record of project-changing user requests in the repository's `prompts/` directory.

## Workflow

1. Preserve the user's request verbatim before acting on it. Include only the user's task prompt, excluding injected skill text, environment context, and system or developer instructions.
2. Inspect `prompts/` to avoid overwriting an existing entry.
3. Create one Markdown file named `YYYY-MM-DD-<short-kebab-slug>.md`. If that name exists, append `-2`, `-3`, and so on.
4. Perform the requested project work.
5. Finish the archive entry after implementation so its impact account reflects the actual result.
6. Include these sections in order:

```markdown
# <Concise title>

Date: YYYY-MM-DD

## Prompt

<Exact user prompt>

## Impacted files

- `path/to/file`: Short description, or `None` when no files changed.

## Changes

Brief prose describing what changed and any important validation result. State clearly when the request was diagnosis-only, blocked, or produced no changes.
```

7. Treat the archive file itself as an impacted file. List every file created, modified, moved, or deleted by the request, including skill metadata and generated configuration files.
8. Determine impacts from the current task's actual edits and targeted version-control inspection. Do not attribute unrelated pre-existing working-tree changes to the prompt.
9. Preserve an existing prompt archive entry unless correcting a factual error in that same entry. Never rewrite `prompts/genesis.md` merely to adopt the newer format.
10. Before handing off, reread the archive entry and verify that the prompt is exact, paths are repository-relative, and the prose matches the completed work.

## Boundaries

- Log project-changing requests, not casual discussion, status questions, or read-only explanations unless the user explicitly asks to archive them.
- Never place secrets, credentials, tokens, or private environment values in an archive. Replace only the sensitive value with `[REDACTED]` and disclose that redaction in `## Changes`.
- Do not invent impacts that were planned but not completed.
