class CreateRates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|
      t.references :currency, null: false, foreign_key: true
      t.float :rate
      t.datetime :changed_at

      t.timestamps
    end
  end
end
