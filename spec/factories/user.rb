FactoryBot.define do
  factory :user do
    name {"ユーザーA"}
    email {"test1@example.com"}
    password {"password"}
    gender {"men"}
    image {""}
    age {"10later"}
  end
end