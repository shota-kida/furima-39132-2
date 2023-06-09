class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :load
  belongs_to :shipping_area
  belongs_to :delivery_day

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :situation_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :load_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_area_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :delivery_day_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :price, presence: true,
             numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validate  :validate_image

  def validate_image
    unless image.attached?
      errors.add(:image, "must be attached")
    end
  end

end

