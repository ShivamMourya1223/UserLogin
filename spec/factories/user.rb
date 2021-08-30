FactoryBot.define do
  factory :user do
    email                 {"test23@gmail.com"}
    password              {"123456"}
    password_confirmation {"123456"}
    username              {"sudhir"}
    role                  {"User"}
  end
end