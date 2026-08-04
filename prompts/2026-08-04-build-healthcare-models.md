# Build healthcare models

Date: 2026-08-04

## Prompt

/goal Our goal is to build all of the below listed models + tests for those models. We should respect repository conventions by ensuring linting always passes (i.e. rubocop). When you need to run commands related to ruby or rails, make sure to use `rvm use` which will pick up the repo defaults properly. Please write a slim amount of tests that just excercise that the relations load properly when using ActiveRecord conventional method helpers. I will instruct you how to structure your commits in terms of what is built and in what order it is built. Tests and linting should be GREEN before we commit anything. Please use conventional commits for the commit verbiage. For each commit, write tests FIRST, then code, then run tests, then refactor as needed. This follows the TDD style of programming and should keep us on track.

## Implementation Strategy

### First commit/chunk
- Provider
  - `name` column, text, unique
  - `address` column, text, unique
- Client
  - `name` column, text, unique
  - `address` column, text, unique

### Second commit/chunk
- Provider/Client Join Table
  - FK for provider_id
  - FK for client_id
  - `plan`, text, enum `basic` or `premium`, codify the enum in ActiveRecord
  - Index: unique(provider_id, client_id)

### Third commit/chunk
- Journal Entries
  - FK provider_client_join_id, nullable
    - include a comment that indicates this is for when journal entries should be *only* available to a particular provider
  - FK client_id
  - `body`, text 
    - Lets make sure to encrypt this column

Those are your instructions. Please build.

## Impacted files

- `app/models/client.rb`: Adds uniqueness validations plus provider and journal-entry associations.
- `app/models/journal_entry.rb`: Adds client and optional provider-client join associations and encrypts the body.
- `app/models/provider.rb`: Adds uniqueness validations and client associations.
- `app/models/provider_client_join.rb`: Adds provider, client, and journal-entry associations plus the string-backed plan enum.
- `config/initializers/active_record_encryption.rb`: Derives Active Record encryption keys from the application key generator.
- `db/migrate/20260804170000_create_providers_and_clients.rb`: Creates providers and clients with unique name and address indexes.
- `db/migrate/20260804171000_create_provider_client_joins.rb`: Creates the provider-client join table, foreign keys, plan, and unique composite index.
- `db/migrate/20260804172000_create_journal_entries.rb`: Creates journal entries with client and optional provider-client join foreign keys, the availability comment, and body.
- `db/schema.rb`: Records all new tables, indexes, foreign keys, and the provider-specific column comment.
- `prompts/2026-08-04-build-healthcare-models.md`: Archives the request and its completed impact.
- `test/models/client_test.rb`: Covers client persistence and uniqueness.
- `test/models/journal_entry_test.rb`: Covers association loading and encrypted body storage.
- `test/models/provider_client_join_test.rb`: Covers through-association loading and plan enum helpers.
- `test/models/provider_test.rb`: Covers provider persistence and uniqueness.

## Changes

Added providers and clients, their plan-bearing join model, and encrypted journal entries in three TDD chunks. Each chunk began with focused failing tests and ended with passing tests and RuboCop. Final validation passed with 8 tests, 23 assertions, and no RuboCop offenses across 36 files.
