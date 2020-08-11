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
  end
end