class Client < ApplicationRecord
  validates :name, uniqueness: true
  validates :address, uniqueness: true
end
