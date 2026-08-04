class RenameAddressToEmailAddress < ActiveRecord::Migration[8.1]
  def change
    safety_assured do
      rename_column :providers, :address, :email_address
      rename_column :clients, :address, :email_address
    end
  end
end
