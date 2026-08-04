# Use Rake task arguments

Date: 2026-08-04

## Prompt

It doesn't look like the passed in parameter is coming through when I call a task like 

bundle exec rake 'working_queries:clients_for_provider[1]'

## Impacted files

- `lib/tasks/working_queries.rake`: Captured Rake task arguments in each block and used the declared named arguments instead of environment variables.
- `prompts/2026-08-04-use-rake-task-arguments.md`: Archived the request and its impact.

## Changes

Updated all four task blocks to accept Rake's task and argument objects. Declared arguments such as `provider_id`, `client_id`, `sort_column`, and `sort_direction` are now read from `args`, so bracket-style task invocations pass values into the existing query implementations. Also updated the journal task usage example to include its declared sort direction argument.
