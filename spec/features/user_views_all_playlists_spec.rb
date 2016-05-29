require 'rails_helper'

RSpec.feature "user views all playlists" do
  scenario "they see the page to view all playlists" do
  playlist = Playlist.create(name: "My Jellies")

  visit playlists_path

  expect(page).to have_content playlist.name
  expect(page).to have_link playlist.name, href: playlist_path(playlist)
  end
end
