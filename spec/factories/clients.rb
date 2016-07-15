FactoryGirl.define do
  factory :client do
    sequence(:name) { |n| "AT&T#{n}" }
    sequence(:abbreviated_name) { |n| "att#{n}" }
  end
end
