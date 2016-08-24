require 'rails_helper'

feature 'user deletes a client', %{
  As a user
  I want to delete a client
  If they are no longer a client of ours

  # Acceptance Criteria
  [] The user can delete a client from the clients index page
  [] User can delete a client from the clients show page

} do

  let!(:app) { App.create(name: "VMM") }
  let!(:clients) { [FactoryGirl.create(:client, app: app, name: "ATT"),
                    FactoryGirl.create(:client, app: app), name: "Cricket"] }
  let!(:client_to_delete) { FactoryGirl.create(:client, app: app, name: "byee") }

  scenario 'user deletes a client from the clients index page' do
    visit clients_path
    within "#client_#{client_to_delete.id}" do
      click_link "Delete"
    end
    expect(page).to have_content("Client Deleted Successfully")
    expect(page).to_not have_content(client_to_delete.name)
  end

  scenario 'user deletes a client from the clients show page' do
    visit clients_path
    within "#app_#{app.id}_clients" do
      click_link client_to_delete.name
    end
    expect(page).to have_content("#{client_to_delete.name} release details")
    click_link "Delete this client"
    expect(page).to have_content("Client Deleted Successfully")
    expect(page).to_not have_content(client_to_delete.name)
  end

end
