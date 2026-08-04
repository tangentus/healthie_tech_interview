providers = [
  { name: "Harbor Health", email_address: "contact@harbor-health.example" },
  { name: "Summit Wellness", email_address: "contact@summit-wellness.example" }
].to_h do |attributes|
  provider = Provider.find_or_initialize_by(name: attributes[:name])
  provider.update!(attributes)
  [ attributes[:name], provider ]
end

clients = [
  { name: "Alex Morgan", email_address: "alex.morgan@example.com" },
  { name: "Blair Chen", email_address: "blair.chen@example.com" },
  { name: "Casey Rivera", email_address: "casey.rivera@example.com" }
].to_h do |attributes|
  client = Client.find_or_initialize_by(name: attributes[:name])
  client.update!(attributes)
  [ attributes[:name], client ]
end

relationships = [
  [ "Harbor Health", "Alex Morgan", :basic ],
  [ "Harbor Health", "Blair Chen", :premium ],
  [ "Summit Wellness", "Blair Chen", :basic ],
  [ "Summit Wellness", "Casey Rivera", :premium ]
].to_h do |provider_name, client_name, plan|
  relationship = ProviderClientJoin.find_or_initialize_by(
    provider: providers.fetch(provider_name),
    client: clients.fetch(client_name)
  )
  relationship.plan = plan
  relationship.save!

  [ [ provider_name, client_name ], relationship ]
end

journal_entries = [
  [ "Alex Morgan", nil, "Alex's client-wide journal entry", 4.days.ago ],
  [ "Alex Morgan", "Harbor Health", "Alex's Harbor Health journal entry", 3.days.ago ],
  [ "Blair Chen", nil, "Blair's client-wide journal entry", 5.days.ago ],
  [ "Blair Chen", "Harbor Health", "Blair's Harbor Health journal entry", 2.days.ago ],
  [ "Blair Chen", "Summit Wellness", "Blair's Summit Wellness journal entry", 1.day.ago ],
  [ "Casey Rivera", nil, "Casey's client-wide journal entry", 6.days.ago ],
  [ "Casey Rivera", "Summit Wellness", "Casey's Summit Wellness journal entry", 12.hours.ago ]
]

journal_entries.each do |client_name, provider_name, body, created_at|
  relationship = relationships.fetch([ provider_name, client_name ]) if provider_name
  entry = JournalEntry.find_or_initialize_by(
    client: clients.fetch(client_name),
    provider_client_join: relationship
  )
  entry.body = body
  entry.created_at ||= created_at
  entry.save!
end
