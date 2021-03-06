# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|nickname|string|null: false|
|email|string|null:false, unique: true|
|password|string|null: false|
|birth_day|string|null: false|

### Association
- has_many :items, dependent: :destroy
- has_one :address, dependent: :destroy
- has_one :card, dependent: :destroy


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postal_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|phone_number|string||

### Association
- belongs_to :user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|condition(enum)|integer|null: false|
|price|integer|null: false|
|category_id|references|null: false, foreign_key: true|
|shipping_cost|integer|null: false|
|prefecture_id|integer|null: false|
|shipping_day|integer|null: false|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|foreign_key :true|
|size|integer||

### Association
- belongs_to :user
- belongs_to :category
- has_many :images, dependent: :destroy
- has_many :comments, dependent: :destroy


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|comment|string||
|delete_check|integer|default: 0|

### Association
- belongs_to :user
- belongs_to :item


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
- has_many :items


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user
