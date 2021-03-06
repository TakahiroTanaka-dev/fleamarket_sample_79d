class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :postal_code, presence: true
  validates :prefecture_id, presence: true
  validates :city, :block, presence: true
  validates :family_name, :first_name, presence: true, format: { with: VALID_NAME_REGEX , message: "は全角のみ使えます" }
  validates :family_name_kana, :first_name_kana, presence: true, format: { with: VALID_KANA_REGEX, message: "は全角カタカナのみ使えます"}
end
