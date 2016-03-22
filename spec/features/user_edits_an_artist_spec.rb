require "rails_helper"

RSpec.feature "user edits an artist" do
  scenario "user navigates to artist show page and edits artist info" do
    artist_name = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create(name: artist_name, image_path: artist_image_path)

    visit artist_path(artist)
    click_link "Edit Artist"
    expect(current_path).to eq edit_artist_path(artist)
    fill_in "Name", with: "Ringo Star"
    click_on "Update Artist"

    expect(page).to have_content "Ringo Star"
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")  
  end
end
