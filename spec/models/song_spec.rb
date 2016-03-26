require 'rails_helper'

RSpec.describe Song, type: :model do
  context "validations" do
    it { should belong_to(:artist)}
    it { is_expected.to validate_presence_of(:title) }
  end

  it "sorts alphabetically" do
    artist_name = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    song_title1 = "Jamin"
    song_title2 = "Buffalo Soldier"
    song_title3 = "Concrete Jungle"
    artist = Artist.create(name: artist_name, image_path: artist_image_path)
    song1 = Song.create(title: song_title1, artist_id: artist.id)
    song2 = Song.create(title: song_title2, artist_id: artist.id)
    song3 = Song.create(title: song_title3, artist_id: artist.id)

    ordered_songs = Song.order_songs
    expect(ordered_songs).to eq [song2,song3,song1]
  end
end
