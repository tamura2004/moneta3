class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :currency, default: "JPY"
      t.decimal :rate
      t.boolean :is_debit, default: false

      t.timestamps
    end
  end
end
