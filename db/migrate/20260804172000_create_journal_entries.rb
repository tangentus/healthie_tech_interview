class CreateJournalEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :journal_entries do |t|
      t.references :provider_client_join,
        null: true,
        foreign_key: true,
        comment: "Limits this journal entry to a particular provider when present"
      t.references :client, null: false, foreign_key: true
      t.text :body, null: false

      t.timestamps
    end
  end
end
