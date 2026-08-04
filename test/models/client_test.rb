require "test_helper"

class ClientTest < ActiveSupport::TestCase
  test "creates and loads a client" do
    client = Client.create!(name: "Alex Doe", address: "456 Oak Avenue")

    assert_equal client, Client.find(client.id)
  end

  test "requires unique names and addresses" do
    Client.create!(name: "Alex Doe", address: "456 Oak Avenue")

    assert_raises(ActiveRecord::RecordNotUnique) do
      Client.create!(name: "Alex Doe", address: "456 Oak Avenue")
    end
  end
end
