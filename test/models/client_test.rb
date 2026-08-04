require "test_helper"

class ClientTest < ActiveSupport::TestCase
  test "creates and loads a client" do
    client = Client.create!(name: "Alex Doe", address: "456 Oak Avenue")

    assert_equal client, Client.find(client.id)
  end

  test "requires unique names and addresses" do
    Client.create!(name: "Alex Doe", address: "456 Oak Avenue")

    duplicate = Client.new(name: "Alex Doe", address: "456 Oak Avenue")

    assert_not duplicate.valid?
    assert_includes duplicate.errors[:name], "has already been taken"
    assert_includes duplicate.errors[:address], "has already been taken"
  end
end
