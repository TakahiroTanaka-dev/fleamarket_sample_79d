class Address < ApplicationRecord
  belongs_to :user

  validates :postal_code, presence: true, format: { with: VALID_POSTAL_REGEX, message: '半角数字のみで入力してください'}
  validates :prefecture_id, presence: true
  validates :city, :block, presence: true
  validates :family_name, :first_name, presence: true, format: { with: VALID_NAME_REGEX , message: "全角のみ使えます" }
  validates :family_name_kana, :first_name_kana, presence: true, format: { with: VALID_KANA_REGEX, message: "全角カタカナのみ使えます"}
end
