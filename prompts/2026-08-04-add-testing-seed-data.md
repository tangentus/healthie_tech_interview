# Add testing seed data

Date: 2026-08-04

## Prompt

Please write some seed data for testing in [seeds.rb](db/seeds.rb) 

## Impacted files

- `db/seeds.rb`: Added repeatable provider, client, relationship, and journal-entry seed records for query testing.
- `prompts/2026-08-04-add-testing-seed-data.md`: Archived the request and its impact.

## Changes

Added an idempotent test dataset with two providers, three clients, four shared relationships covering both plans, and seven client-wide or provider-restricted journal entries. Journal entries receive varied creation times so sort-column behavior can be exercised.
