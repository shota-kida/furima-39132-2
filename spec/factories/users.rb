FactoryBot.define do
  factory :user do
    
    email               {Faker::Internet.free_email}
    password            {Faker::Internet.password(min_length: 6)}
    encrypted_password  {password}
    name                {'山田'}
    nickname            {Faker::Name.initials(number: 2)}
    name_zenkaku        {'太郎'}
    name_kana           {'ヤマダ'}
    name_mei            {'タロウ'}
    birthday            {'1994-01-01'}
  end
end
