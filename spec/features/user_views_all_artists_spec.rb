require 'rails_helper'

RSpec.feature "User views all artists" do

  scenario "they go to the artists index" do
    artist = Artist.new(name: "Jerry Garica", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    artist_name = artist.name
    artist.save

    artist2 = Artist.new(name: "Neil Young", image_path: "http://captaingino.com/wp-content/uploads/2015/11/Neil-Young.jpg")
    artist2_name = artist2.name
    artist2.save

    visit '/artists'

    expect(page).to have_content artist_name
    expect(page).to have_content artist2_name
  end
end
