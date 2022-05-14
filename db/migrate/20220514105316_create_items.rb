class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.string :category
      t.float :price
      t.text :description
      t.string :condition
      t.boolean :delivery
      t.boolean :long_rental
      t.boolean :availability
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
