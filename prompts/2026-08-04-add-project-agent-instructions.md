# Add project agent instructions

Date: 2026-08-04

## Prompt

Lets add instructions to our projects `.agents/instructions` that instruct the following

- Use `rvm` for ruby version management
- Always follow TDD when applying changes
- Use rubocop for linting and make sure linting passes before any commits
- Always make sure tests are passing before making commits
- All commits should use conventional commit verbiage

## Impacted files

- `.agents/instructions`: Adds repository-local Ruby, TDD, linting, testing, and commit-message requirements.
- `prompts/2026-08-04-add-project-agent-instructions.md`: Archives this request and its implementation impact.

## Changes

Added the requested repository-local agent instructions. No application code changed, and no commit was created because the prompt did not request one.
