class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :id_name
      t.string :name
      t.string :kana_name
      t.integer :masked_password
      t.string :credit_number

      t.timestamps
    end
  end
end
