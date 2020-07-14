class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :number, null: false
      t.integer :amount, null: false
      t.date :start_date
      t.date :end_date

      t.references :product, forengn_key: true
      t.references :branch
      t.references :user
      t.references :account
      t.timestamps
    end
  end
end
