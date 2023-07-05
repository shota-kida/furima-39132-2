class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :post_code, :shipping_area_id, :cities, :number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id, numericality: { other_than: 1, message: "Shipping area id can't be blank" }
    validates :cities
    validates :number
    validates :user_id
    validates :item_id
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid" }
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, shipping_area_id: shipping_area_id, cities: cities, number: number, building_name: building_name, phone_number: phone_number,purchase_id: purchase.id)
  end
end