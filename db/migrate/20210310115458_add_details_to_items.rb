class AddDetailsToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :name, :string, null: false
    add_column :items, :description, :text, null: false
    add_column :items, :category_id, :integer, null: false
    add_column :items, :status_id, :integer, null: false
    add_column :items, :shipping_charges_id, :integer, null: false
    add_column :items, :prefecture_id, :integer, null: false
    add_column :items, :days_to_ship_id, :integer, null: false
    add_column :items, :price, :integer, null: false
    add_reference :items, :user, null: false, foreign_key: true
  end
end
