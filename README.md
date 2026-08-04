# Healthie Technical Interview

This Rails application models providers, clients, provider-specific plans, and client journal entries. It demonstrates the requested ActiveRecord queries through Rake tasks rather than controllers so that API endpoints can be designed and implemented during the technical session.

## Requirements

- Ruby 3.4.3
- PostgreSQL
- Bundler 2.6.7

## Setup

Install the dependencies, prepare the database, and load the demonstration data:

```sh
bundle install
bin/rails db:prepare
bin/rails db:seed
```

The default development and test database configuration expects PostgreSQL at `127.0.0.1:5432` with the username and password `postgres`. Override `DATABASE_HOST`, `DATABASE_PORT`, `DATABASE_USERNAME`, and `DATABASE_PASSWORD` as needed.

## Tests

Run the model test suite with:

```sh
bin/rails test
```

## ActiveRecord query demonstrations

The seeded database includes two providers, three clients, provider-client plans, and journal entries. Use the relevant database IDs when invoking these tasks.

All clients for a provider:

```sh
bundle exec rake 'working_queries:clients_for_provider[PROVIDER_ID]'
```

All providers for a client:

```sh
bundle exec rake 'working_queries:providers_for_client[CLIENT_ID]'
```

All journal entries for a client, sorted by a journal-entry column and direction:

```sh
bundle exec rake 'working_queries:journals_for_client[CLIENT_ID,created_at,asc]'
```

All journal entries across every client of a provider, sorted by a journal-entry column and direction:

```sh
bundle exec rake 'working_queries:journals_for_all_clients[PROVIDER_ID,created_at,asc]'
```

`SORT_COLUMN` must exactly match a `JournalEntry` column. `SORT_DIRECTION` uses ascending order only when its value is `asc`; every other value uses descending order.
