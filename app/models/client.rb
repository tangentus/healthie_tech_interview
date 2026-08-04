class Client < ApplicationRecord
  has_many :provider_client_joins
  has_many :providers, through: :provider_client_joins
  has_many :journal_entries

  validates :name, uniqueness: true
  validates :address, uniqueness: true
end
