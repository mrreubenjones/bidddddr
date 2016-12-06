FactoryGirl.define do
  factory :bid do
    association :user
    association :auction
    amount { rand(1000) + 1 }
  end
end
