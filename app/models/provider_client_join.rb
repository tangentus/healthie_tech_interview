class ProviderClientJoin < ApplicationRecord
  belongs_to :provider
  belongs_to :client
  has_many :journal_entries

  enum :plan, { basic: "basic", premium: "premium" }, validate: true
end
