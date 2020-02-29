FactoryBot.define do
  factory :question do
    title {"テストのタイトル"}
    body {"テストの本文"}
    category {"rundown"}
    user
  end
end