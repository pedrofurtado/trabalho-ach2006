FactoryGirl.define do
  factory :room do
    sequence(:number) { |n| n }
    sequence(:guest_limit) { Faker::Number.between(1, 5) }
    sequence(:services) { FactoryGirl.create_list :service, 2 }
  end
end
