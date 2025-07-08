require 'rails_helper'

RSpec.describe GooglePlacesService do
  it "returns nil for an invalid location" do
    fake_response = double(code: 200, parsed_response: { "places" => [] })
    allow(HTTParty).to receive(:post).and_return(fake_response)

    service = GooglePlacesService.new("Testing Invalid Place")
    expect(service.call).to be_nil
  end

  it "returns lat/lng for a valid location" do
    # Stub the HTTParty.post to avoid real API call
    response_body = {
      "places" => [
        { "location" => { "latitude" => 17.38504, "longitude" => 78.48667 } }
      ]
    }
    fake_response = double(code: 200, parsed_response: response_body)
    allow(HTTParty).to receive(:post).and_return(fake_response)

    service = GooglePlacesService.new("Hyderabad, India")
    expect(service.call).to eq({ lat: 17.38504, lng: 78.48667 })
  end
end