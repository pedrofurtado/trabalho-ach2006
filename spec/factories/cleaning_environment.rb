FactoryGirl.define do
  factory :cleaning_environment do
    sequence(:cleaning_date) { Faker::Date.between(6.months.ago, 6.months.from_now) }
    association :environment, factory: :environment
  end
end
