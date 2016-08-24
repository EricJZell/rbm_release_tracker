require 'rails_helper'

feature 'user edits a release', %{
  As a user
  I want to edit a release
  So that the app pages shows up to date releases

  # Acceptance Criteria
  [] The user can navigate to the form from the app show page
  [] The user fills out branch, tag, and checks off which clients are applicable
  [] The user may optionally fill out a description

} do

  let!(:app) { App.create(name: "VMM") }
  let!(:clients) { [FactoryGirl.create(:client, app: app, name: "ATT"),
                    FactoryGirl.create(:client, app: app), name: "Cricket"] }
  let!(:release) { FactoryGirl.create(:release, app: app, release_date: Time.now) }

  scenario 'user edits a release with valid info' do
    visit app_path(app)
    within "#release_#{release.id}" do
      click_link "Edit"
    end
    fill_in "Branch name", with: "rel_15_5_1_rc"
    fill_in "Tag name", with: "v15.5.1"
    check "ATT"
    click_button "Save"
    expect(page).to have_content("Release Updated Successfully")
  end

  scenario 'user edits a release with invalid info' do
    visit app_path(app)
    within "#release_#{release.id}" do
      click_link "Edit"
    end
    fill_in "Branch name", with: ""
    fill_in "Tag name", with: ""
    click_button "Save"
  end

end
