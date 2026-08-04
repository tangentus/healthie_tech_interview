require "test_helper"

class ProviderClientJoinTest < ActiveSupport::TestCase
  test "loads providers and clients through the join" do
    provider = Provider.create!(name: "Care Center", email_address: "provider@example.com")
    client = Client.create!(name: "Alex Doe", email_address: "client@example.com")

    provider.provider_client_joins.create!(client:, plan: :basic)

    assert_equal [ client ], provider.clients.to_a
    assert_equal [ provider ], client.providers.to_a
  end

  test "supports basic and premium plans" do
    basic_join = ProviderClientJoin.new(plan: :basic)
    premium_join = ProviderClientJoin.new(plan: :premium)

    assert_predicate basic_join, :basic?
    assert_predicate premium_join, :premium?
  end
end
