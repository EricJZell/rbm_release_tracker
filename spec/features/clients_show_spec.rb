require 'rails_helper'

feature 'user views a clients details', %{
  As a user
  I want to view a client\'s details page
  So that I can see the releases for that client.

  # Acceptance Criteria
  [] The client details page lists the current release for that client
  [] The client deails page lists the client's in descending order of release

} do

  let!(:client) { FactoryGirl.create(:client_with_releases) }

  scenario 'user views a clients details' do
    visit clients_path
    click_link client.name

    within('#current_release') do
      expect(page).to have_content(client.current_release.description)
    end

    within('#release_history') do
      client.releases.released.each do |release|
        expect(page).to have_content(release.tag_name)
      end
    end

    within('#pending_releases') do
      client.releases.pending.each do |release|
        expect(page).to have_content(release.tag_name)
      end
    end

  end

end
