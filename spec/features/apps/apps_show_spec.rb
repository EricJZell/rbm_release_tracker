require 'rails_helper'

feature 'user views the details page for an app', %{
  As a user
  I want to view an apps details page
  So that I can see the releases for that app

  # Acceptance Criteria
  [] The apps details page lists the releases for that app
  [] I can navigate to the details page from the apps index
  [] The apps release history is shown
  [] The apps pending releases are shown

} do

  let!(:app) { App.create(name: "VMM") }
  let!(:releases) { [FactoryGirl.create(:release, app: app),
                    FactoryGirl.create(:release, app: app),
                    FactoryGirl.create(:release, app: app, release_date: Time.now),
                    FactoryGirl.create(:release, app: app, release_date: Time.now - 1.day),
                  ] }

  before do
    visit apps_path
    click_link("#{app.name}")
  end

  scenario 'user can navigate to app details from app index' do
    expect(page).to have_content("#{app.name} Release Details:")
  end

  scenario 'user can view the release history of the app' do
    within('#app_release_history') do
      app.releases.released.each do |release|
        expect(page).to have_content(release.tag_name)
      end
    end
  end

  scenario 'user can view the pending releases of an app' do
    within('#app_pending_releases') do
      app.releases.pending.each do |release|
        expect(page).to have_content(release.tag_name)
      end
    end
  end

end
