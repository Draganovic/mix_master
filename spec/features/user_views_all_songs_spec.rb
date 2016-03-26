require 'rails_helper'

RSpec.feature "user views all songs" do
  scenario "they see all songs associated with an artist" do

    artist_name = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    song_title1 = "Jamin"
    song_title2 = "Buffalo Soldier"
    song_title3 = "Concrete Jungle"
    artist = Artist.create(name: artist_name, image_path: artist_image_path)
    song1 = Song.create(title: song_title1, artist_id: artist.id)
    song2 = Song.create(title: song_title2, artist_id: artist.id)
    song3 = Song.create(title: song_title3, artist_id: artist.id)

    visit artist_path(artist)
    click_on "View Songs"
    expect(page).to have_content song_title1
    expect(page).to have_content song_title2
    expect(page).to have_content song_title3

    click_on song_title1
    expect(current_path).to eq song_path(song1)
    expect(page).to have_content song_title1
    expect(page).to have_link(artist_name, href: artist_path(artist))
  end
end
