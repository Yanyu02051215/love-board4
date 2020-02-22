FactoryBot.define do
  factory :question do
    title {"テストのタイトル"}
    body {"テストの説明"}
    category {"rundown"}
    user
  end
end