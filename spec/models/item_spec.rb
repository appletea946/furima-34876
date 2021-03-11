require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品' do
      context '商品の出品ができる時' do
        it '情報が正しく入力されていれば出品できる' do
          expect(@item).to be_valid
        end
      end
      context '商品の出品ができない時' do
        it 'imageが選択されていなければ出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'nameが空では出品できない' do
          @item.name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'descriptionが空では出品できない' do
          @item.description = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it 'category_idが1では出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        it 'status_idが1では出品できない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Status must be other than 1")
        end
        it 'shipping_charges_idが1では出品できない' do
          @item.shipping_charges_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping charges must be other than 1")
        end
        it 'prefecture_idが1では出品できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
        end
        it 'days_to_ship_idが1では出品できない' do
          @item.days_to_ship_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
        end
        it 'priceが空では出品できない' do
          @item.price = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'priceが文字列では出品できない' do
          @item.price = "abc123"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'priceが全角数字では出品できない' do
        @item.price = '１０００'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'priceが300より安いなら出品できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it 'priceが9,999,999より高いなら出品できない' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
      end
    end
  end
end
