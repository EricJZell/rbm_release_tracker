require 'rails_helper'

feature 'user creates a new release', %{
  As a user
  I want to create a new release
  So that the app pages shows up to date releases

  # Acceptance Criteria
  [] The user can navigate to the form from the app show page
  [] The user fills out branch, tag, and checks off which clients are applicable
  [] The user may optionally fill out a description

} do

  let!(:apps) { [App.create(name: "VMM"), App.create(name: "Vodafone")]}
  let!(:clients) { [FactoryGirl.create(:client, app: apps[0]),
                    FactoryGirl.create(:client, app: apps[0])] }

  scenario 'user creates a valid new release' do
    visit app_path(apps[0])
    click_link "Add a new release"
    fill_in "Branch Name", with: "rel_15_5_1_rc"
    fill_in "Tag Name", with: "v15.5.1"
    check "att"
    click_button "Create Release"
    expect(page).to have_content("New Release Created Successfully")
  end

  scenario 'user fills out form with invalid inputs' do
    visit app_path(apps[0])
    click_link "Add a new release"
    check "att"
    click_button "Save"
    expect(page).to have_content("Branch Name can't be blank")
  end

end
