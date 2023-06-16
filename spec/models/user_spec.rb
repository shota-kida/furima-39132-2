require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailが重複している場合は登録できない' do
      existing_user = FactoryBot.create(:user)
      user = FactoryBot.build(:user, email: existing_user.email)
      user.valid?
      expect(user.errors.full_messages).to include("Email has already been taken")
    end

    it 'emailに@を含まない場合は登録できない' do
      user = FactoryBot.build(:user, email: 'invalid_email')
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end

    it 'passwordが空では登録できない' do
      user = FactoryBot.build(:user)
      user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが6文字未満では登録できない' do
      user = FactoryBot.build(:user, password: 'short')
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordが英字のみの場合は登録できない' do
      user = FactoryBot.build(:user, password: 'password')
      user.valid?
      expect(user.errors.full_messages).to include("Password は半角英字と数字の両方を含めて設定してください")
    end

    it 'passwordが数字のみの場合は登録できない' do
      user = FactoryBot.build(:user, password: '123456')
      user.valid?
      expect(user.errors.full_messages).to include("Password は半角英字と数字の両方を含めて設定してください")
    end

    it 'passwordが全角文字を含む場合は登録できない' do
      user = FactoryBot.build(:user, password: 'Ｐａｓｓｗｏｒｄ１２３')
      user.valid?
      expect(user.errors.full_messages).to include("Password は半角英字と数字の両方を含めて設定してください")
    end

    it 'password_confirmationが空では登録できない' do
      user = FactoryBot.build(:user)
      user.password_confirmation = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordとpassword_confirmationが一致しない場合は登録できない' do
      user = FactoryBot.build(:user, password: 'password', password_confirmation: 'different_password')
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '姓（全角）が空では登録できない' do
      user = FactoryBot.build(:user)
      user.name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Name can't be blank")
    end

    it '姓（全角）に半角文字が含まれている場合は登録できない' do
      user = FactoryBot.build(:user, name: 'Kida')
      user.valid?
      expect(user.errors.full_messages).to include("Name は全角文字で入力してください")
    end

    it '名（全角）が空では登録できない' do
      user = FactoryBot.build(:user)
      user.name_zenkaku = ''
      user.valid?
      expect(user.errors.full_messages).to include("Name zenkaku can't be blank")
    end

    it '名（全角）に半角文字が含まれている場合は登録できない' do
      user = FactoryBot.build(:user, name_zenkaku: 'Kida')
      user.valid?
      expect(user.errors.full_messages).to include("Name zenkaku は全角文字で入力してください")
    end

    it '姓（カタカナ）が空では登録できない' do
      user = FactoryBot.build(:user)
      user.name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include("Name kana can't be blank")
    end

    it '姓（カタカナ）にカタカナ以外の文字が含まれている場合は登録できない' do
      user = FactoryBot.build(:user, name_kana: 'Kida')
      user.valid?
      expect(user.errors.full_messages).to include("Name kana は全角カタカナで入力してください")
    end

    it '名（カタカナ）が空では登録できない' do
      user = FactoryBot.build(:user)
      user.name_mei = ''
      user.valid?
      expect(user.errors.full_messages).to include("Name mei can't be blank")
    end

    it '名（カタカナ）にカタカナ以外の文字が含まれている場合は登録できない' do
      user = FactoryBot.build(:user, name_mei: 'Kida')
      user.valid?
      expect(user.errors.full_messages).to include("Name mei は全角カタカナで入力してください")
    end

    it 'birthdayが空では登録できない' do
      user = FactoryBot.build(:user)
      user.birthday = ''
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end




