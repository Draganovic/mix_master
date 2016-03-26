require 'rails_helper'

RSpec.feature "user deletes an artist" do
  scenario "artist is deleted from show page and no longer appears in index" do
    artist_name1 = "Bob Marley"
    artist_image_path1 = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist_name2 = "Frank Sinatra"
    artist_image_path2 = "http://www.sinatra.com/sites/default/files/styles/news-thumbnail/public/Sinatra_blue%20copy_0.jpg?itok=nwmJe_Er"
    artist1 = Artist.create(name: artist_name1, image_path: artist_image_path1)
    artist2 = Artist.create(name: artist_name2, image_path: artist_image_path2)

    visit artist_path(artist1)


    click_on "Delete"
    expect(current_path).to eq artists_path
    expect(page).to have_content artist_name2
    expect(page).to_not have_content artist_name1
  end
end
