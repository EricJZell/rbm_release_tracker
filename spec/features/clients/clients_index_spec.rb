require 'rails_helper'

feature 'user views list of clients', %{
  As a user
  I want to view a list of clients
  So that I can select the one I want to track

  # Acceptance Criteria
  [] All clients are shown in the list
  [] I can navigate to the clients index from the root path

} do

  let!(:apps) { [App.create(name: "VMM"), App.create(name: "Vodafone")]}
  let!(:clients) { [FactoryGirl.create(:client, app: apps[0]),
                    FactoryGirl.create(:client, app: apps[1])] }

  scenario 'user views details of two different apps' do
    visit root_path
    click_link("Clients")
    expect(page).to have_content(clients[0].name)
    expect(page).to have_content(clients[1].name)
  end


end
