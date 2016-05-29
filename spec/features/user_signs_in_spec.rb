require 'rails_helper'

RSpec.feature "User signs in with Spotify" do
  scenario "they see a link to sign out" do
    auth_data = {
      'provider' => 'spotify',
      'info'     => { 'id' => 'Fake User'}
    }

    OmniAuth.config.mock_auth[:spotify] = auth_data

    visit root_path

    click_link "Sign in with Spotify"
    expect(page).to have_content("Sign out")
    expect(page).to have_content(auth_data['info']['id'])
    expect(page).to_not have_content("Sign in with Spotify")
  end
end
