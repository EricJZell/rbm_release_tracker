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

  describe "#formatted_release_date" do
    it "puts the created_at date in a human readable format" do
      release = FactoryGirl.create(:release, app: apps.first, release_date: Time.now)
      expect(release.formatted_release_date).to eq(release.release_date.strftime("%B %d, %Y, %H:%M"))
    end
  end

  describe "#released?" do
    it "returns true for a release that has been marked as released" do
      release = FactoryGirl.create(:release, app: apps.first)
      expect(release.released?).to be(false)
      release.update_attribute(:release_date, Time.now - 1.day)
      expect(release.released?).to be(true)
    end
  end

end
