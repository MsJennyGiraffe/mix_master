RSpec.feature "User edits an artist" do
  scenario "they are able to edit an artist that exists in the database" do
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create(
      name: "Bob Marley",
      image_path: artist_image_path
    )

    visit artist_path(artist)
    click_link "Edit"
    fill_in "artist_name", with: "The New Bob Marley"
    click_button "Update Artist"

    expect(page).to have_content("The New Bob Marley")
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
