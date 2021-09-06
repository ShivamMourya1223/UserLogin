# FactoryGirl.define do
#   sequence(:email) {|n| "user#{n}@example.com"}
#   sequence(:login) {|n| "user#{n}"}
#   factory :user do
#     email {FactoryGirl.generate :email}
#     login {FactoryGirl.generate :login}
#     password "abc"
#     admin false
#   end
# end