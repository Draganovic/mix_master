require 'rails_helper'

RSpec.feature "user can view all artists" do
  scenario "can navigate to show from index" do
    artist_name1 = "Bob Marley"
    artist_image_path1 = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist_name2 = "Ringo Star"
    artist_image_path2 = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist1 = Artist.create(name: artist_name1, image_path: artist_image_path1)
    artist2 = Artist.create(name: artist_name2, image_path: artist_image_path2)

    visit artists_path
    expect(page).to have_content artist_name1
    expect(page).to have_content artist_name2
    click_on artist1.name
    expect(current_path).to eq(artist_path(artist1))
    expect(page).to have_content artist_name1
    expect(page).to_not have_content artist_name2
  end
end
