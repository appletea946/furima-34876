class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charges
  belongs_to :prefecture
  belongs_to :days_to_ship

  with_options presence: true do
    validates :name
    validates :description

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_charges_id
      validates :prefecture_id
      validates :days_to_ship_id
    end
    
    validates :price
    validates :image
  end
end