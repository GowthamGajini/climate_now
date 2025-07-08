require 'rails_helper'

RSpec.describe "Address based Search bar", type: :system do
  it "shows a search bar on the home page" do
    visit root_path
    expect(page).to have_field("Enter location or area")
  end

  it "shows error if location is blank and form is submitted" do
    visit root_path
    find('#location').send_keys(:enter)
    expect(page).to have_content("Please enter a location")
  end

  it "shows error for a location with only spaces" do
    visit root_path
    fill_in "location", with: "   "
    find('#location').send_keys(:enter)
    expect(page).to have_content("Please enter a location")
  end

  it "shows error for gibberish location" do
    visit root_path
    fill_in "location", with: "asdfghjklzxcvbnm"
    find('#location').send_keys(:enter)
    expect(page).to have_content("Location not Found")
  end

  it "shows temperature if valid location is entered" do
    visit root_path
    fill_in "location", with: "Hyderabad"
    find('#location').send_keys(:enter)
    expect(page).to have_content("Temperature")
  end

  it "shows description if present in weather data" do
    Rails.cache.clear
    allow_any_instance_of(LocationToZipcodeService).to receive(:call).and_return("500001")
    allow_any_instance_of(WeatherAtZipcodeLocation).to receive(:call).and_return({ temperature: 30, description: "clear sky" })

    visit root_path
    fill_in "location", with: "Hyderabad"
    find('#location').send_keys(:enter)
    expect(page).to have_content("clear sky")
  end

  it "shows cache indicator when data is fetched from cache" do
    Rails.cache.write("weather_at_zipcode:500001", { temperature: 28, description: "cloudy" })
    allow_any_instance_of(LocationToZipcodeService).to receive(:call).and_return("500001")

    visit root_path
    fill_in "location", with: "Hyderabad"
    find('#location').send_keys(:enter)
    expect(page).to have_content("from cache")
  end
end
