FactoryGirl.define do
  factory :cleaning_room do
    sequence(:cleaning_date) { Faker::Date.between(6.months.ago, 6.months.from_now) }
    association :room, factory: :room
  end
end
