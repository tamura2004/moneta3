class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :number, null: false
      t.integer :amount, null: false
      t.datetime :start_time
      t.datetime :end_time

      t.references :product, forengn_key: true
      t.references :branch, forengn_key: true
      t.references :user, forengn_key: true
      t.timestamps
    end
  end
end
