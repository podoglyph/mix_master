require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they enter data and see updated name" do
    artist = Artist.new(name: "Jerry Garcia", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    artist_name = artist.name
    artist_image_path = artist.image_path
    artist.save
    artist_id = artist.id
    new_name = "Lars Ulrich"

    visit "/artists/#{artist_id}"
    click_on 'Edit'
    fill_in 'artist_name', with: new_name
    click_on 'Update Artist'

    expect(page).to have_content new_name
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
