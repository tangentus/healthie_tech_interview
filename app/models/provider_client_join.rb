class ProviderClientJoin < ApplicationRecord
  belongs_to :provider
  belongs_to :client

  enum :plan, { basic: "basic", premium: "premium" }, validate: true
end
