require 'rails_helper'
describe Item do
  describe '#create' do

    it "is valid with if all items are filled out" do
      item = FactoryBot.build(:item)
      expect(item).to be_valid
    end
  end
end