require "test_helper"

class JournalEntryTest < ActiveSupport::TestCase
  test "loads client-wide and provider-specific journal entries" do
    provider = Provider.create!(name: "Care Center", email_address: "provider@example.com")
    client = Client.create!(name: "Alex Doe", email_address: "client@example.com")
    provider_client_join = provider.provider_client_joins.create!(client:, plan: :premium)

    client_entry = client.journal_entries.create!(body: "Client-wide note")
    provider_entry = provider_client_join.journal_entries.create!(client:, body: "Provider note")

    assert_nil client_entry.provider_client_join
    assert_equal [ client_entry, provider_entry ], client.journal_entries.order(:id).to_a
    assert_equal [ provider_entry ], provider_client_join.journal_entries.to_a
  end

  test "encrypts the body" do
    client = Client.create!(name: "Alex Doe", email_address: "client@example.com")
    journal_entry = client.journal_entries.create!(body: "Private note")

    stored_body = JournalEntry.connection.select_value(
      "SELECT body FROM journal_entries WHERE id = #{journal_entry.id}"
    )

    assert_equal "Private note", journal_entry.reload.body
    assert_not_equal "Private note", stored_body
  end
end
