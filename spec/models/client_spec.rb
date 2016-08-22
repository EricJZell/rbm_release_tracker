require 'rails_helper'

describe Client do

  let!(:app) { FactoryGirl.create(:app) }
  let(:unreleased_release) { FactoryGirl.create(:release, app: app) }
  let(:new_release) { FactoryGirl.create(:release, app: app, release_date: (Time.now)) }
  let(:old_release) { FactoryGirl.create(:release, app: app, release_date: (Time.now - 5.days)) }
  let(:client) { FactoryGirl.create(:client, app: app) }

  describe "#current_release" do
    it "returns releases the latest released release for the client" do
      client.releases << [unreleased_release, new_release, old_release]
      expect(client.current_release).to eq(new_release)
    end
  end

  describe "#released?" do
    it "returns true for a release that has been marked as released" do
      expect(unreleased_release.released?).to be(false)
      expect(new_release.released?).to be(true)
    end
  end
end
