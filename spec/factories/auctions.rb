FactoryGirl.define do
  factory :auction do
    association       :user
    title             {Faker::Lorem.word}
    details           {Faker::Lorem.paragraph}
    date_ending       {Faker::Date.forward(30)}
    reserve_price     {rand(100) + 1}
  end
end

