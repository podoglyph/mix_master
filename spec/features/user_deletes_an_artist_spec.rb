require 'rails_helper'

RSpec.feature "User can delete an artist" do

  scenario "they should not see the artist's name on the index" do

    artist = Artist.new(name: "Leonard Cohen", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    artist_name = artist.name
    artist_image_path = artist.image_path
    artist.save
    artist_id = artist.id

    visit "/artists/#{artist_id}"
    click_on "Delete"

    expect(page).not_to have_content artist_name
    expect(page).to have_content "All Artists"

  end
end
