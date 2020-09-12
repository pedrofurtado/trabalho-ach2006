FactoryGirl.define do
  factory :invoice do
    sequence(:payment_type) { Faker::Lorem.sentence 5 }
    sequence(:total_value) { Faker::Number.decimal 2, 2 }
    association :booking, factory: :booking
    association :employee, factory: :employee
  end
end
