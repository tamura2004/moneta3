class CreateStatements < ActiveRecord::Migration[6.0]
  def change
    create_table :statements do |t|
      t.string :user_id_name, null: false
      t.string :instrument_name, null: false      
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
