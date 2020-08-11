FactoryBot.define do
  factory :item do
    id {"1"}
    name {"AWS"}
    description {"mo"}
    condition {"新品・未使用"}
    price {"908"}
    category_id {"200"}
    shipping_cost {"送料込み（出品者負担)"}
    prefecture_id {"福島県"}
    shipping_day {"4〜7日で発送"}
    seller_id {"1"}
    buyer_id {"2"}
    after(:build) do |item|                           
      item.images << build(:image, item: item)  
    end
  end
end
