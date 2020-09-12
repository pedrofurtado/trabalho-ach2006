FactoryGirl.define do
  factory :environments_use do
    association :booking, factory: :booking
    sequence(:environment) { FactoryGirl.create :environment }
    sequence(:used_at) { Faker::Date.between(booking.check_in, booking.check_out) }
  end
end
