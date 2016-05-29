require 'rails_helper'

RSpec.feature "User submits a new song" do
  scenario "they see the page for the individual song" do
    artist = create(:artist)

    song_title = "The Greatest Song in the World"

    visit artist_path(artist)
    click_on "New Song"
  expect(current_path)
    fill_in "song_title", with: song_title
    click_on "Create Song"

    expect(page).to have_content song_title
    expect(page).to have_link artist.name, href: artist_path(artist)
  end
end
