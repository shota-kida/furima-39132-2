class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

     
         validates :email, presence: true, uniqueness: true
         validates :password, presence: true, length: { minimum: 6 }
         validates :name, presence: true
         validates :nickname, presence: true
         validates :name_zenkaku, presence: true
         validates :name_kana, presence: true
         validates :name_mei, presence: true
         validates :birthday, presence: true
         validate :password_complexity

         def password_complexity
          return if password.blank? || password.match?(/\A(?=.*[a-zA-Z])(?=.*\d)/)
          errors.add(:password, "は半角英字と数字の両方を含めて設定してください")
        end
end
