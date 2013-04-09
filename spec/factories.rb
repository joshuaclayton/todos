FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :todo do
    title 'Buy some eggs'
    owner { generate(:email) }

    trait :completed do
      completed_at { 2.days.ago }
    end
  end
end
