FactoryBot.define do

  factory :image do
    image   {File.open("#{Rails.root}/spec/fixtures/犬.jpg")}
    item
  end

end