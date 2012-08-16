FactoryGirl.define do
  factory :todo do
    description 'Buy milk'

    trait :completed do
      completed_at { 2.days.ago }
    end
  end
end
