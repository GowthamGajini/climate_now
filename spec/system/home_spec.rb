require 'rails_helper'

RSpec.describe "Address based Search bar", type: :system do
  it "should shows a search bar on the home page" do
    visit root_path
    expect(page).to have_field("Enter location or area")
  end

  it "shows error if location is blank and form is submitted" do
    visit root_path
    find('#location').send_keys(:enter)
    expect(page).to have_content("Please enter a location")
  end

  it "shows temperature if valid location is entered" do
    visit root_path
    fill_in "location", with: "Hyderabad"
    find('#location').send_keys(:enter)
    expect(page).to have_content("Temperature")
  end
end