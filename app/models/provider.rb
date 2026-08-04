class Provider < ApplicationRecord
  validates :name, uniqueness: true
  validates :address, uniqueness: true
end
