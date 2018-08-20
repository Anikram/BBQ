FactoryBot.define do
  factory :user do
    sequence(:id) { |n| "#{n}" }
    sequence(:email) { |n| "user_test_#{n}@example.com" }

    after(:build) { |u| u.password_confirmation = u.password = '123456' }
  end
end
