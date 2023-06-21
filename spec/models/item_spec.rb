require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '正常系' do
    it '全ての項目が正しく入力されている場合、登録できること' do
      expect(@item).to be_valid
    end
  end

  describe 'バリデーション' do
    it 'titleが空では登録できないこと' do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end

    it '画像がからでは登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image must be attached")
    end

    it 'catch_copyが空では登録できないこと' do
      @item.catch_copy = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Catch copy can't be blank")
    end

    it 'category_idが空では登録できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'category_idが1の場合は登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'situation_idが空では登録できないこと' do
      @item.situation_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Situation can't be blank")
    end

    it 'situation_idが1の場合は登録できないこと' do
      @item.situation_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Situation can't be blank")
    end

    it 'load_idが空では登録できないこと' do
      @item.load_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Load can't be blank")
    end

    it 'load_idが1の場合は登録できないこと' do
      @item.load_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Load can't be blank")
    end

    it 'shipping_area_idが空では登録できないこと' do
      @item.shipping_area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank")
    end

    it 'shipping_area_idが1の場合は登録できないこと' do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank")
    end

    it 'delivery_day_idが空では登録できないこと' do
      @item.delivery_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day can't be blank")
    end

    it 'delivery_day_idが1の場合は登録できないこと' do
      @item.delivery_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day can't be blank")
    end

    it 'priceが空では登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '商品価格に半角数字以外が含まれていると出品できないこと' do
      @item.price = 'abc'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    
    it '商品価格が299円以下では出品できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    
    it '商品価格が10,000,000円以上では出品できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
  end


  describe 'アソシエーション' do
    it 'ユーザーが紐付いていなければ投稿できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end

    it '画像が添付されていること' do
      expect(@item).to be_valid
    end
  end
end
