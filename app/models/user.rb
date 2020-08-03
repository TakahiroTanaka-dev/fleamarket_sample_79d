class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_one :address, dependent: :destroy
  has_one :card, dependent: :destroy
  
  
  validates :nickname, :birth_day, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, confirmation: true, length: { minimum: 7 }
  validates :family_name, :first_name, presence: true, format: { with: VALID_NAME_REGEX , message: "は全角のみ使えます" }
  validates :family_name_kana, :first_name_kana, presence: true, format: { with: VALID_KANA_REGEX, message: "は全角カタカナのみ使えます"}
end
