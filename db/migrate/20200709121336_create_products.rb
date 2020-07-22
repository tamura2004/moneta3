class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :currency, default: "JPY"
      t.decimal :rate
      t.integer :minus_limit, default: 0
      t.boolean :is_debit, default: false
      t.boolean :is_fixed, default: false
      t.boolean :is_credit, default: false

      t.timestamps
    end
  end
end
