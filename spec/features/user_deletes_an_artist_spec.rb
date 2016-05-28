RSpec.feature "user deletes an artist" do
  scenario "they can delete an artist if it exists in the database" do
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create(
      name: "Bob Marley",
      image_path: artist_image_path
    )

    visit artist_path(artist)
    click_link "Delete"

    expect(page).not_to have_content "Bob Marley"
    expect(current_path).to eq(artists_path)
  end
end
