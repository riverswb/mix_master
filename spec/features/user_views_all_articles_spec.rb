require 'rails_helper'

RSpec.feature "User views the artists index" do
  scenario "they see the page for all of the artists" do
    Artist.create(name: "The Avalanches", image_path: "http://cdn4.pitchfork.com/albums/381/909d52ed.jpeg")
    Artist.create(name: "C A R L S A G A N", image_path: "https://scontent.fapa1-2.fna.fbcdn.net/v/t1.0-9/303038_185540744850547_7836761_n.jpg?oh=9ac107f5c41c0866f835ed553569d52c&oe=58FB7C43")
    Artist.create(name: "The Books", image_path: "http://www.wordlessmusic.org/wp-content/uploads/2012/09/The+Books++at+UVM+photo+by+greg.jpeg")

    visit artists_path

    expect(page).to have_content "The Avalanches"
    expect(page).to have_css("img[src=\"http://cdn4.pitchfork.com/albums/381/909d52ed.jpeg\"]")
    expect(page).to have_content "C A R L S A G A N"
    expect(page).to have_css("img[src=\"https://scontent.fapa1-2.fna.fbcdn.net/v/t1.0-9/303038_185540744850547_7836761_n.jpg?oh=9ac107f5c41c0866f835ed553569d52c&oe=58FB7C43\"]")
    expect(page).to have_content "The Books"
    expect(page).to have_css("img[src=\"http://www.wordlessmusic.org/wp-content/uploads/2012/09/The+Books++at+UVM+photo+by+greg.jpeg\"]")
  end
end
