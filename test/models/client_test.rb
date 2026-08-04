require "test_helper"

class ClientTest < ActiveSupport::TestCase
  test "creates and loads a client" do
    client = Client.create!(name: "Alex Doe", email_address: "client@example.com")

    assert_equal client, Client.find(client.id)
    assert_equal "client@example.com", client.email_address
  end

  test "requires unique names and email addresses" do
    Client.create!(name: "Alex Doe", email_address: "client@example.com")

    assert_raises(ActiveRecord::RecordNotUnique) do
      Client.create!(name: "Alex Doe", email_address: "client@example.com")
    end
  end
end
