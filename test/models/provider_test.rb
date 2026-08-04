require "test_helper"

class ProviderTest < ActiveSupport::TestCase
  test "creates and loads a provider" do
    provider = Provider.create!(name: "Care Center", email_address: "provider@example.com")

    assert_equal provider, Provider.find(provider.id)
    assert_equal "provider@example.com", provider.email_address
  end

  test "requires unique names and email addresses" do
    Provider.create!(name: "Care Center", email_address: "provider@example.com")

    assert_raises(ActiveRecord::RecordInvalid) do
      Provider.create!(name: "Care Center", email_address: "provider@example.com")
    end
  end
end
