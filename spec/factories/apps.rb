FactoryGirl.define do
  factory :app do
    sequence(:name) { |n| "app_name_#{n}" }
  end
end
