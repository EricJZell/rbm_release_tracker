require 'rails_helper'

feature 'user views list of apps', %{
  As a user
  I want to view a list of apps
  So that I can select the one I want to track

  # Acceptance Criteria
  [] All apps are shown in the list
  [] I am brought to the apps index from the root path

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
