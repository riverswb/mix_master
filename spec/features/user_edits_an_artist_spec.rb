require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario 'they can update an artist' do
    artist = Artist.create(name: "the avalanches", image_path: "htp://cdn4.pitchfork.com/albums/381/909d52ed.jpeg")

    visit artists_path
    click_on "Edit"
    fill_in "artist_name", with: "The Avalanches"
    fill_in "artist_image_path", with: "http://cdn4.pitchfork.com/albums/381/909d52ed.jpeg"
    click_on "Update Artist"

    expect(page.current_path).to eq artist_path(artist)
    expect(page).to have_content "The Avalanches"
    expect(page).to have_css("img[src=\"http://cdn4.pitchfork.com/albums/381/909d52ed.jpeg\"]")
  end
end
