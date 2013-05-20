FactoryGirl.define do
  factory :todo do
    sequence(:owner_email) {|n| "person#{n}@example.com" }
  end
end
