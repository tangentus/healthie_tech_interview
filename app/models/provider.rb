class Provider < ApplicationRecord
  has_many :provider_client_joins
  has_many :clients, through: :provider_client_joins

  validates :name, uniqueness: true
  validates :email_address, uniqueness: true
end
