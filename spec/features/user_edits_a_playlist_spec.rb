# As a user
# Given that a playlist and songs exist in the database
# When I visit that playlist's show page
# And I click on "Edit"
# And I enter a new playlist name
# And I select an additional song
# And I uncheck an existing song
# And I click on "Update Playlist"
# Then I should see the playlist's updated name
# And I should see the name of the newly added song
# And I should not see the name of the removed song

RSpec.feature "User edits a playlist" do
  scenario "user can edit a playlist" do
    song_one, song_two = create_list(:song, 2)
    playlist = Playlist.create(name: "My Jellies")
    playlist.songs = [song_one]

    visit playlist_path(playlist)

    expect(page).to have_content song_one.title

    click_link "Edit"

    fill_in "Name", with: "I could make a sandwich with all dis."

    uncheck("song-#{song_one.id}")
    check("song-#{song_two.id}")

    click_button "Update Playlist"
    expect(page).to have_content "I could make a sandwich with all dis."
    expect(page).to_not have_content "My Jellies"
    expect(page).to_not have_content song_one.title
    expect(page).to have_content song_two.title
  end
end
