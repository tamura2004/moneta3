class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :user_id_name, null: false
      t.string :name, null: false
      t.integer :amount, null: false
      t.datetime :start_time
      t.datetime :end_time

      t.references :user, forengn_key: true
      t.timestamps
    end
  end
end
