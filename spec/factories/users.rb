FactoryBot.define do

  factory :user do
    id {"1"}
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name {"田中"}
    first_name  {"田中"}
    family_name_kana  {"タナカ"}
    first_name_kana {"タナカ"}
    birth_day {"2020/08/02"}
  end

end