require 'rails_helper'

feature 'Mark a release as released', %{
  As a user
  I want to mark a pending release as released
  So that I know what releases have been pushed to production

  # Acceptance Criteria
  [] The user can mark a release from the details page of an app (app#show)
  [] In the list of pending releases, there is a link to mark a release as released
  [] The app details page is then re-loaded
  [] The release that was marked released is displayed in the Release History table

} do

  let!(:app) { App.create(name: "VMM") }
  let!(:releases) { [FactoryGirl.create(:release, app: app),
                    FactoryGirl.create(:release, app: app),
                    FactoryGirl.create(:release, app: app, release_date: Time.now),
                    FactoryGirl.create(:release, app: app, release_date: Time.now - 1.day),
                  ] }
  let!(:release_to_tag) { FactoryGirl.create(:release, app: app) }

  before do
    visit apps_path
    click_link("#{app.name}")
  end

  scenario 'user marks a release a released' do
    within "#release_#{release_to_tag.id}_pending" do
      click_link "Mark as released!"
    end
    release_to_tag.reload
    expect(release_to_tag.release_date).to_not be_nil
    expect(page).to have_content("#{release_to_tag.tag_name} has been marked as released")
    within "#app_pending_releases" do
      expect(page).to_not have_content(release_to_tag.tag_name)
    end
    within "#app_release_history" do
      expect(page).to have_content(release_to_tag.tag_name)
    end
  end

end
