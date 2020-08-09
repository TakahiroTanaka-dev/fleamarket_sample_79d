require 'rails_helper'
describe Item do
  describe '#create' do
    let(:user) { create(:user) }
    let(:category) { create(:category) }
    it "is invalid with if all items aren't filled out" do
      item = build(:item, seller_id: user.id, category_id: category.id)
      item.valid?
      expect(item).to be_valid
    end

    # it "is invalid without a name" do
    #   item = Item.new(name: "", description: "a", condition: 2, price: 123, category_id: 1, shipping_cost: 1, prefecture_id: 3, shipping_day: 1)
    #   item.valid?
    #   expect(item.errors[:name]).to include("を入力してください")
    # end

    # it "is invalid without a description" do
    #   item = Item.new(name: "a", description: "", condition: 2, price: 123, category_id: 1, shipping_cost: 1, prefecture_id: 3, shipping_day: 1)
    #   item.valid?
    #   expect(item.errors[:description]).to include("を入力してください")
    # end

    # it "is invalid without a condition" do
    #   item = Item.new(name: "a", description: "a", condition: "", price: 123, category_id: 1, shipping_cost: 1, prefecture_id: 3, shipping_day: 1)
    #   item.valid?
    #   expect(item.errors[:condition]).to include("を入力してください")
    # end

    # it "is invalid without a price" do
    #   item = Item.new(name: "a", description: "a", condition: 1, price: "", category_id: 1, shipping_cost: 1, prefecture_id: 3, shipping_day: 1)
    #   item.valid?
    #   expect(item.errors[:price]).to include("を入力してください")
    # end

    # it "is invalid without a category_id" do
    #   item = Item.new(name: "a", description: "a", condition: 1, price: 123, category_id: "", shipping_cost: 1, prefecture_id: 3, shipping_day: 1)
    #   item.valid?
    #   expect(item.errors[:category_id]).to include("を入力してください")
    # end

    # it "is invalid without a shipping_cost" do
    #   item = Item.new(name: "a", description: "a", condition: 1, price: 123, category_id: 1, shipping_cost: "", prefecture_id: 3, shipping_day: 1)
    #   item.valid?
    #   expect(item.errors[:shipping_cost]).to include("を入力してください")
    # end

    # it "is invalid without a prefecture_id" do
    #   item = Item.new(name: "a", description: "a", condition: 1, price: 123, category_id: 1, shipping_cost: 1, prefecture_id: "", shipping_day: 1)
    #   item.valid?
    #   expect(item.errors[:prefecture_id]).to include("を入力してください")
    # end

    # it "is invalid without a shipping_day" do
    #   item = Item.new(name: "a", description: "a", condition: 1, price: 123, category_id: 1, shipping_cost: 1, prefecture_id: 1, shipping_day: "")
    #   item.valid?
    #   expect(item.errors[:shipping_day]).to include("を入力してください")
    # end
  end
end