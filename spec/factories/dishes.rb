FactoryBot.define do
  factory :dish do
    association :user
    dish { Faker::Food.dish }
    category_id { rand(2..7) }
    remark { Faker::Food.measurement }
  end
end
