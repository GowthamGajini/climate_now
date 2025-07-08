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
end