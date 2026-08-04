class CreateProviderClientJoins < ActiveRecord::Migration[8.1]
  def change
    create_table :provider_client_joins do |t|
      t.references :provider, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.text :plan, null: false

      t.timestamps
    end

    add_index :provider_client_joins, %i[provider_id client_id], unique: true
  end
end
