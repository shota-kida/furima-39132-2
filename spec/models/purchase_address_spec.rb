require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '寄付情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
    end

    context '正常系' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it 'shipping_area_idを選択していないと保存できないこと' do
        @purchase_address.shipping_area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Shipping area Shipping area id can't be blank")
      end

      it 'citiesが空だと保存できないこと' do
        @purchase_address.cities = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Cities can't be blank")
      end

      it 'numberが空だと保存できないこと' do
        @purchase_address.number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Number can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが9桁以下では保存できないこと' do
        @purchase_address.phone_number = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      
      it 'phone_numberが12桁以上では保存できないこと' do
        @purchase_address.phone_number = '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      
      it 'phone_numberが半角数字以外の文字を含む場合は保存できないこと' do
        @purchase_address.phone_number = '123-4567-8901'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'userが紐付いていないと保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが紐づいていなければ購入できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end