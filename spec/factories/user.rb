FactoryBot.define do
  factory :user do
    email                 {"ram@gmail.com"}
    password              {"123456"}
    password_confirmation {"123456"}
    username              {"ram"}
    role                  {"User"}
  end
end