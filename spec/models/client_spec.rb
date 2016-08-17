require 'rails_helper'

describe Client do

  let!(:app) { FactoryGirl.create(:app) }
  let(:previous_release) { FactoryGirl.create(:release, app: app, created_at: (Time.now - 1.day)) }
  let(:new_release) { FactoryGirl.create(:release, app: app, created_at: (Time.now)) }
  let(:old_release) { FactoryGirl.create(:release, app: app, created_at: (Time.now - 5.days)) }
  let(:client) { FactoryGirl.create(:client, app: app) }

  describe "#current_release" do
    it "returns releases the latest release for the client" do
      client.releases << [previous_release, new_release, old_release]
      expect(client.current_release).to eq(new_release)
    end
  end
end
