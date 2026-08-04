class JournalEntry < ApplicationRecord
  belongs_to :client
  belongs_to :provider_client_join, optional: true

  encrypts :body
end
