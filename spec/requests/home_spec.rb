require 'rails_helper'

RSpec.describe "Home", type: :request do
  describe "GET /" do
    it "Should show the home page" do
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end
end

RSpec.describe "Address based Search bar", type: :system do
  it "should show a search bar on the home page" do
    visit root_path
    expect(page).to have_field("Enter location or area")
  end
end
