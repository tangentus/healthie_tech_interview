# Add Rake task parameters

Date: 2026-08-04

## Prompt

Lets just add parameters to these rake task definitions [working_queries.rake](lib/tasks/working_queries.rake) . DO NOT IMPLEMENT anything, just add parameters. Please also add instructions for how to call the rake task at the top of this file.

clients_for_providers: should accept a provider ID
providers_for_client: should accept a client ID
journals_for_client: should accept a client ID and sort column (sort column is on journal entries table)
journals_for_all_clients: should accept a provider ID

## Impacted files

- `lib/tasks/working_queries.rake`: Added named task parameters and invocation examples without implementing task bodies.
- `prompts/2026-08-04-add-rake-task-parameters.md`: Archived the request and its impact.

## Changes

Added the requested Rake task argument declarations and documented how to invoke each task. Preserved the existing singular `clients_for_provider` task name because the request limited the change to parameters. All task bodies remain empty.
