require 'rails_helper'

RSpec.feature "user can see all existing playlists" do
  scenario "they see multiple playlists on playlist index" do
    artist_name1 = "Bob Marley"
    artist_name2 = "Elton John"
    artist_image_path1 = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist_image_path2 = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    song_title1 = "Jamin"
    song_title2 = "Buffalo Soldier"
    song_title3 = "Concrete Jungle"
    song_title4 = "Rocketman"
    artist1 = Artist.create(name: artist_name1, image_path: artist_image_path1)
    artist2 = Artist.create(name: artist_name2, image_path: artist_image_path2)
    song1 = Song.create(title: song_title1, artist_id: artist1.id)
    song2 = Song.create(title: song_title2, artist_id: artist1.id)
    song3 = Song.create(title: song_title3, artist_id: artist1.id)
    song4 = Song.create(title: song_title4, artist_id: artist2.id)
    playlist_name1 = "one playlist"
    playlist_name2 = "two playlist"
    playlist1 = Playlist.create(name: playlist_name1, song_ids: [song1.id, song3.id])
    playlist2 = Playlist.create(name: playlist_name2, song_ids: [song2.id, song4.id])

    visit playlists_path

    expect(page).to have_content playlist_name1
    expect(page).to have_content playlist_name2
    save_and_open_page
    click_link playlist1.name

    expect(page).to have_content song1.title
    expect(page).to have_content song3.title
    expect(page).to_not have_content song2.title
  end
end

# As a user
# Given that playlists exist in the database
# When I visit the playlists index
# Then I should see each playlist's name
# And each name should link to that playlist's individual page
