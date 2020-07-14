class CreateStatements < ActiveRecord::Migration[6.0]
  def change
    create_table :statements do |t|
      t.integer :amount, null: false
      t.text :memo
      t.references :account, foreign_key: true
      t.timestamps
    end
  end
end
