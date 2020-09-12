FactoryGirl.define do
  factory :environment do
    sequence(:name) { |n| "#{Faker::Name} #{n}" }
    sequence(:description) { Faker::Lorem.sentence 5 }
    sequence(:price) { Faker::Number.decimal 2, 2 }
  end
end
