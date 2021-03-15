require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address,user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '購入情報が保存できるとき' do
      it '情報が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it '建物名が抜けていても保存できる' do
        @order_address.building_name = ""
        expect(@order_address).to be_valid
      end
    end
    context '購入情報が保存できない時' do
      it 'tokenが空では保存できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では保存できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeはハイフンがないと保存できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが1では保存できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'municipalityが空では保存できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空では保存できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは半角英字では保存できない' do
        @order_address.phone_number = 'abcdefg'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberは全角角英字では保存できない' do
        @order_address.phone_number = 'ａｂｃｄｅｆｇ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberは全角数字字では保存できない' do
        @order_address.phone_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberは英数字混合では保存できない' do
        @order_address.phone_number = '123abcd4567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberは12桁以上では保存できない' do
        @order_address.phone_number = '123456789010'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Input only number')
      end
      it 'user_idが空では保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
