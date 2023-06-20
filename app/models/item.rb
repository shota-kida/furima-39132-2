class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :situation_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :load_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_area_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :delivery_day_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :price, presence: true
end

