require 'rails_helper'

describe Release do

  let!(:apps) { [FactoryGirl.create(:app), FactoryGirl.create(:app) ]}

  describe ".for_app" do
    it "returns releases for the app provided as the argument" do
      releases = [FactoryGirl.create(:release, app: apps[0]),
                  FactoryGirl.create(:release, app: apps[1])]
      app0_releases = Release.for_app(apps[0])
      expect(app0_releases).to include(releases[0])
    end
  end
end
