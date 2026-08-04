# Usage:
#   bundle exec rake 'working_queries:clients_for_provider[PROVIDER_ID]'
#   bundle exec rake 'working_queries:providers_for_client[CLIENT_ID]'
#   bundle exec rake 'working_queries:journals_for_client[CLIENT_ID,SORT_COLUMN,SORT_DIRECTION]'
#   bundle exec rake 'working_queries:journals_for_all_clients[PROVIDER_ID,SORT_COLUMN,SORT_DIRECTION]'

namespace :working_queries do
  desc "All clients for a given provider"
  task :clients_for_provider, [ :provider_id ] => :environment do |_task, args|
    puts "provider_id = #{args[:provider_id]}"
    clients = ProviderClientJoin.joins(:client).where(provider_id: args[:provider_id]).map(&:client)
    render(clients)
  end

  desc "All providers for a given client"
  task :providers_for_client, [ :client_id ] => :environment do |_task, args|
    providers = ProviderClientJoin.joins(:provider).where(client_id: args[:client_id]).map(&:provider)
    render(providers)
  end

  desc "All journal entries for a given client, with sorting"
  task :journals_for_client, [ :client_id, :sort_column, :sort_direction ] => :environment do |_task, args|
    # exact match, normalize to using the column name from the model
    column_name = normalize_sort_column(args[:sort_column])
    raise ArgumentError, "SORT_COLUMN doesn't exist" unless column_name.present?

    sort_direction = normalize_sort_direction(args[:sort_direction])

    render(JournalEntry.where(client_id: args[:client_id]).order("#{column_name} #{sort_direction}"))
  end

  desc "All journal entries across all clients of a given provider, with sorting"
  task :journals_for_all_clients, [ :provider_id, :sort_column, :sort_direction ] => :environment do |_task, args|
    # exact match, normalize to using the column name from the model
    column_name = normalize_sort_column(args[:sort_column])
    raise ArgumentError, "SORT_COLUMN doesn't exist" unless column_name.present?

    sort_direction = normalize_sort_direction(args[:sort_direction])

    render(JournalEntry.joins(client: :providers).where(providers: { id: args[:provider_id] }).order("#{column_name} #{sort_direction}"))
  end

  def normalize_sort_column(sort_column)
    JournalEntry.column_names.find { _1 == sort_column }
  end

  def normalize_sort_direction(sort_direction)
    sort_direction == "asc" ? "asc" : "desc"
  end

  def render(data)
    puts JSON.pretty_generate(data.map { _1.attributes.as_json })
  end
end
