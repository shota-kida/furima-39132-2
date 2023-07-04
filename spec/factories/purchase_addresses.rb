FactoryBot.define do
  factory :purchase_address do
    post_code        { '123-4567' }
    shipping_area_id { 2 }
    cities { '東京都' }
    number { '1-1' }
    building_name { 'ハイツ' }
    phone_number {'00000000000'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
