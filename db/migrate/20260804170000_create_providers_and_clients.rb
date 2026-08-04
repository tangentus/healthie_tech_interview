class CreateProvidersAndClients < ActiveRecord::Migration[8.1]
  def change
    create_table :providers do |t|
      t.text :name, null: false
      t.text :address, null: false

      t.timestamps
    end
    add_index :providers, :name, unique: true
    add_index :providers, :address, unique: true

    create_table :clients do |t|
      t.text :name, null: false
      t.text :address, null: false

      t.timestamps
    end
    add_index :clients, :name, unique: true
    add_index :clients, :address, unique: true
  end
end
