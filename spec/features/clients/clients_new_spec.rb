require 'rails_helper'

feature 'user creates a new client', %{
  As a user
  I want to create a new client
  So that I can keep track of new clients we pick up

  # Acceptance Criteria
  [] The user can visit the new client form from the clients index page
  [] The user must fill out the name and abbreviated name of the new client

} do

  let!(:app) { App.create(name: "VMM") }

  scenario 'user creates a a new client with valid name and abbreviation' do
    visit clients_path
    within("#app_#{app.id}_clients") do
      click_link "Add a new client!"
    end
    expect(page).to have_content("Please Enter New Client Information:")
    fill_in "Name", with: "Sprint"
    fill_in "Abbreviated name", with: "sprint"
    click_button "Save"
    expect(page).to have_content("New Client Created Successfully")
    within("#app_#{app.id}_clients") do
      expect(page).to have_content("Sprint")
    end
  end

  scenario 'user fills out form with invalid inputs' do
    visit clients_path
    within("#app_#{app.id}_clients") do
      click_link "Add a new client!"
    end
    click_button "Save"
    expect(page).to have_content("Name can't be blank")
  end

end
