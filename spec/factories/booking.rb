FactoryGirl.define do
  factory :booking do
    sequence(:check_in) { Faker::Date.between(Date.today, 20.days.from_now) }
    sequence(:check_out) { Faker::Date.between(check_in + 1.day, check_in + 20.days) }
    sequence(:rooms) { FactoryGirl.create_list :room, 2 }
    association :guest, factory: :guest
    sequence(:companions) { Faker::Number.between(0, (rooms.inject(0){ |sum, e| sum + e.guest_limit }))-1 }
  end
end
