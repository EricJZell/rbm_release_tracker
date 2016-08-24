require 'rails_helper'

feature 'user deletes a release', %{
  As a user
  I want to delete a release
  So that it is not shown in the apps releases

  # Acceptance Criteria
  [] The user can delete a release from the list of apps releases
  [] The user can delete a release from the release show page

} do

  let!(:app) { App.create(name: "VMM") }
  let!(:clients) { [FactoryGirl.create(:client, app: app, name: "ATT"),
                    FactoryGirl.create(:client, app: app), name: "Cricket"] }
  let!(:release) { FactoryGirl.create(:release, app: app, release_date: Time.now) }

  scenario 'user deletes a release from the app page' do
    visit app_path(app)
    within "#release_#{release.id}" do
      click_link "Delete"
    end
    expect(page).to have_content("Release Deleted Successfully")
    expect(page).to_not have_content(release.tag_name)
  end

  scenario 'user deletes a release from the release page' do
    visit app_path(app)
    within "#release_#{release.id}" do
      click_link release.tag_name
    end
    click_link "Delete"
    expect(page).to have_content("Release Deleted Successfully")
    expect(page).to_not have_content(release.tag_name)
  end

end
