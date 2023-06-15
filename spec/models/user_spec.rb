require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user) 
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない'do
    user = FactoryBot.build(:user) 
    user.email = ''
    user.valid?
    expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない'do
    user = FactoryBot.build(:user) 
    user.password = ''
    user.valid?
    expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'password_confirmationが空では登録できない'do
    user = FactoryBot.build(:user) 
    user.password_confirmation = ''
    user.valid?
    expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'nameが空では登録できない'do
    user = FactoryBot.build(:user) 
    user.name = ''
    user.valid?
    expect(user.errors.full_messages).to include("Name can't be blank")
    end
    it 'name_zenkakuが空では登録できない'do
    user = FactoryBot.build(:user) 
    user.name_zenkaku = ''
    user.valid?
    expect(user.errors.full_messages).to include("Name zenkaku can't be blank")
    end
    it 'name_kanaが空では登録できない'do
    user = FactoryBot.build(:user) 
    user.name_kana= ''
    user.valid?
    expect(user.errors.full_messages).to include("Name kana can't be blank")
    end
    it 'name_meiが空では登録できない'do
    user = FactoryBot.build(:user) 
    user.name_mei = ''
    user.valid?
    expect(user.errors.full_messages).to include("Name mei can't be blank")
    end
    it 'birthdayが空では登録できない'do
    user = FactoryBot.build(:user) 
    user.birthday = ''
    user.valid?
    expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
