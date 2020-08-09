require 'rails_helper'
describe Item do
  describe '#create' do
    it "is invalid without a name" do
      item = Item.new(name: "", description: "a", condition: 2, price: 123, category_id: 1, shipping_cost: 1, prefecture_id: 3, shipping_day: 1, seller_id: 1 )
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a description" do
      item = Item.new(name: "a", description: "", condition: 2, price: 123, category_id: 1, shipping_cost: 1, prefecture_id: 3, shipping_day: 1, seller_id: 1 )
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end
  end
end