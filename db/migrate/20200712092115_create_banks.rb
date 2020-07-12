class CreateBanks < ActiveRecord::Migration[6.0]
  def change
    create_table :banks do |t|
      t.integer :number, null: false
      t.string :name, null: false
      t.string :kana_name
      t.boolean :myself, null: false

      t.timestamps
    end
  end
end
