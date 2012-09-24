FactoryGirl.define do
  factory :todo do
    title 'Buy some milk'
    owner_email 'person@example.com'

    trait :completed do
      completed_at { Time.now }
    end
  end
end
