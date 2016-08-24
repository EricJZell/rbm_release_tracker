require 'rails_helper'

feature 'user updates client', %{
  As a user
  I want to update a client
  So that I can edit their name or abbreviation

  # Acceptance Criteria
  [] The user can visit the update client form from the clients index page
  [] The user must fill out the name and abbreviated name of the new client

} do

  let!(:app) { App.create(name: "VMM") }
  let!(:client) { Client.create(app: app, name: "wrong name", abbreviated_name: "wn") }

  scenario 'user updates a client with valid name and abbreviation' do
    visit clients_path
    within("#client_#{client.id}") do
      click_link "Edit"
    end
    expect(page).to have_content("Please Enter Updated Client Information:")
    fill_in "Name", with: "right name"
    fill_in "Abbreviated name", with: "rn"
    click_button "Save"
    expect(page).to have_content("Client Updated Successfully")
    within("#app_#{app.id}_clients") do
      expect(page).to have_content("right name")
    end
  end

  scenario 'user fills out form with invalid inputs' do
    visit edit_client_path(client)
    fill_in "Name", with: ""
    click_button "Save"
    expect(page).to have_content("Name can't be blank")
  end

end
