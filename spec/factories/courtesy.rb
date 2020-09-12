FactoryGirl.define do
  factory :courtesy do
    sequence(:name) { |n| "#{Faker::Name} #{n}" }
    sequence(:description) { Faker::Lorem.sentence 5 }
    sequence(:price) { Faker::Number.decimal 2, 2 }
  end
end
