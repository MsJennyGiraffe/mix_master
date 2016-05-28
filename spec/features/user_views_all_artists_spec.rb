# As a user
# Given that artists exist in the database
# When I visit the artists index
# Then I should see each artist's name
# And each name should link to that artist's individual page

require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they see the page for all of the artists" do
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    Artist.create(
      name: "Bob Marley",
      image_path: artist_image_path
    )

    visit artists_path
    click_link "Bob Marley"
    
    expect(page).to have_content("Bob Marley")
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
