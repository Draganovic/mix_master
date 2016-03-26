require 'rails_helper'

RSpec.describe ArtistsController, type: :controller do
  describe "GET #index" do
    it "assigns all artists as @artists and renders the index template" do
      artist_name1 = "Bob Marley"
      artist_image_path1 = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

      artist1 = Artist.create(name: artist_name1, image_path: artist_image_path1)

      get(:index)

      expect(assigns(:artists)).to eq([artist1])
      expect(response).to render_template("index")
    end
  end
end
