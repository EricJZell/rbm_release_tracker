require 'rails_helper'

feature 'user views the details page for an app', %{
  As a user
  I want to view an apps details page
  So that I can see the releases for that app

  # Acceptance Criteria
  [] The apps details page lists the releases for that app
  [] I can navigate to the details page from the apps index

} do

  let!(:apps) { [App.create(name: "VMM"), App.create(name: "Vodafone")]}

  scenario 'user navigates to root path' do
    visit root_path
    expect(page).to have_content(apps[0].name)
    expect(page).to have_content(apps[1].name)
  end

  scenario 'user navigates to apps path' do
    visit apps_path
    expect(page).to have_content(apps[0].name)
    expect(page).to have_content(apps[1].name)
  end

end
