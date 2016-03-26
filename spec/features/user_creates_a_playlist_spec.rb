require 'rails_helper'

RSpec.feature "user creates a playlist" do
    scenario "they see page for individual playlist" do
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
      playlist_name = "Now Thats What I Call Hits 579"

      visit playlists_path

      click_on "New Playlist"
      fill_in "playlist_name", with: playlist_name
      check("song-#{song1.id}")
      check("song-#{song4.id}")
      click_on "Create Playlist"

      expect(page).to have_content playlist_name

      within("li:first") do
        expect(page).to have_link song1.title, href: song_path(song1)
      end

      within("li:last") do
        expect(page).to have_link song4.title, href: song_path(song4)
      end
  end
end

# As a user
# Given that songs and artists exist in the database
# When I visit the playlists path
# And I click "New playlist"
# And I fill in a name
# And I select the songs for the playlist
# And I click "Create Playlist"
# Then I see the playlist title
# And I see the titles of all songs in that playlist
# And the titles should link to the individual song pages
