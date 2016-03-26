require 'rails_helper'

RSpec.feature "user edits a playlist" do
  scenario "they update the name of a playlist" do
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

    visit playlist_path(playlist1)

    click_on "Edit"
    expect(current_path).to eq edit_playlist_path(playlist1)
    fill_in "playlist_name", with: "new playlist name"
    check("song-#{song4.id}")
    uncheck("song-#{song3.id}")
    click_on "Update Playlist"

    expect(page).to have_content "new playlist name"
    expect(page).to have_content song4.title
    expect(page).to have_content song1.title
    expect(page).to_not have_content song3.title
  end
end

# As a user
# Given that a playlist and songs exist in the database
# When I visit that playlist's show page
# And I click on "Edit"
# And I enter a new playlist name
# And I select an additional song
# And I uncheck an existing song
# And I click on "Update Playlist"
# Then I should see the playlist's updated name
# And I should see the name of the newly added song`
# And I should not see the name of the removed song
