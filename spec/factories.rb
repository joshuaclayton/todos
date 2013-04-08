FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :todo do
    title 'Buy some eggs'
    owner { generate(:email) }
  end
end
