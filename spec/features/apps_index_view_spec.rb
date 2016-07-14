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
  let!(:releases) { [FactoryGirl.create(:release, app: apps[0]),
                    FactoryGirl.create(:release, app: apps[1])] }

  scenario 'user views details of two different apps' do
    visit apps_path
    click_link("#{apps[0].name}")
    expect(page).to have_content(releases[0].branch_name)
    visit apps_path
    click_link("#{apps[1].name}")
    expect(page).to have_content(releases[1].branch_name)
  end


end
