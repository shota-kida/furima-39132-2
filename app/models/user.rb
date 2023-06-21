class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  has_many :items

  validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX, message: "は半角英字と数字の両方を含めて設定してください" }
  validates :name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角文字で入力してください" }
  validates :nickname, presence: true
  validates :name_zenkaku, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角文字で入力してください" }
  validates :name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }
  validates :name_mei, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }
  validates :birthday, presence: true

  validate :password_complexity

  private

  def password_complexity
    return if password.blank? || (password.match?(/\A(?=.*?[a-zA-Z])(?=.*\d)/) && password.length >= 6)
    errors.add(:password, "は半角英字と数字の両方を含めて設定してください")
  end
end