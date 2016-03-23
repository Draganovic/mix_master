require 'rails_helper'

RSpec.feature "user creates a song" do
  scenario "they see a page for the individual song" do
    artist_name1 = "Bob Marley"
    artist_image_path1 = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist1 = Artist.create(name: artist_name1, image_path: artist_image_path1)
    song_title = "Jamin"

    visit artist_path(artist1)
    click_on "New Song"
    fill_in "song_title", with: song_title
    click_on "Create Song"

    expect(page).to have_content song_title
  end
end
