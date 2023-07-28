class CreateCurrencies < ActiveRecord::Migration[6.0]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :description
      t.float :rate_max
      t.float :rate_min
      t.string :symbol

      t.timestamps
    end
  end
end
