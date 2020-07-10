class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.text :description
      t.string :path
      t.references :page, foreign_key: true

      t.timestamps
    end
  end
end
