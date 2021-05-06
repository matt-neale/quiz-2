FactoryBot.define do
  factory :user do
    first_name{Faker::Name.first_name}
    last_name{Faker::Name.last_name}
    sequence(:email){|n| "John-#{n}@smith.com"}
    password{"supersecret"}
  end
end
