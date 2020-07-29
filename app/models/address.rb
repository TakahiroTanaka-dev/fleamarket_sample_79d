class Address < ApplicationRecord
  belongs_to :user

  validates :postal_code, presence: true, format: { with: VALID_POSTAL_REGEX, message: '半角数字のみで入力してください'}
  validates :prefecture_id, presence: true
  validates :city, :block, presence: true
end
