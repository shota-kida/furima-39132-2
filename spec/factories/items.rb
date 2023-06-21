FactoryBot.define do
  factory :item do
    title            {Faker::Lorem.sentence}
    catch_copy       {Faker::Lorem.sentence}
    category_id      { 2 }
    situation_id     { 2 }
    load_id          { 2 }
    shipping_area_id { 2 }
    delivery_day_id  { 2 }
    price            { 1000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('app/assets/images/._item-sample.png')), filename: '._item-sample.png')
    end
  end
end
