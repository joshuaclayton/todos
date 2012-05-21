FactoryGirl.define do
  factory :todo do
    name 'Buy some milk'

    trait :incomplete do
      completed_at nil
    end

    trait :complete do
      completed_at { Time.now }
    end
  end
end
