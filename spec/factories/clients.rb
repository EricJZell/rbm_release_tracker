FactoryGirl.define do
  factory :client do
    sequence(:name) { |n| "AT&T#{n}" }
    sequence(:abbreviated_name) { |n| "att#{n}" }
    app

    factory :client_with_releases do
      after(:create) do |client|
        releases = [
          FactoryGirl.create(:release, app: client.app, release_date: (Time.now - 5.days)),
          FactoryGirl.create(:release, app: client.app, release_date: (Time.now - 1.day)),
          FactoryGirl.create(:release, app: client.app, release_date: (Time.now)),
          FactoryGirl.create(:release, app: client.app)
        ]
        client.releases << releases
      end
    end
  end
end
