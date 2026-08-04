require "test_helper"

class ProviderTest < ActiveSupport::TestCase
  test "creates and loads a provider" do
    provider = Provider.create!(name: "Care Center", address: "123 Main Street")

    assert_equal provider, Provider.find(provider.id)
  end

  test "requires unique names and addresses" do
    Provider.create!(name: "Care Center", address: "123 Main Street")

    assert_raises(ActiveRecord::RecordInvalid) do
      Provider.create!(name: "Care Center", address: "123 Main Street")
    end
  end
end
