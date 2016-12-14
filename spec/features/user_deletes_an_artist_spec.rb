require 'rails_helper'

RSpec.feature 'User views the artist\'s show page' do
  scenario "they see the artist and an image" do
    artist = Artist.create(name: "The Avalanches", image_path: "http://cdn4.pitchfork.com/albums/381/909d52ed.jpeg")

    visit artist_path(artist)
    expect(page).to have_content "The Avalanches"
    expect(page).to have_css("img[src=\"http://cdn4.pitchfork.com/albums/381/909d52ed.jpeg\"]")

    click_on "Delete"
    expect(page.current_path).to eq artists_path
    expect(page).to_not have_content "The Avalanches"
  end
end
