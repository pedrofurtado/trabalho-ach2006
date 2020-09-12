FactoryGirl.define do
  factory :meal do
    sequence(:name) { |n| "#{Faker::Name} #{n}" }
    sequence(:price) { Faker::Number.decimal 2, 2 }
  end
end
