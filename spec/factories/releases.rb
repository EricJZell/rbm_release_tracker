FactoryGirl.define do
  factory :release do
    sequence(:branch_name) { |n| "rel_v1_1_#{n}" }
    sequence(:tag_name) { |n| "v1.1.#{n}" }
    sequence(:description) { |n| "This release includes #{n} new updates" }
  end
end
