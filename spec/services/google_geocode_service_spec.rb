require 'rails_helper'

RSpec.describe GoogleGeocodeService do
  it "returns nil if no zipcode is found" do
    response_body = { "results" => [] }
    fake_response = double(code: 200, parsed_response: response_body)
    allow(HTTParty).to receive(:get).and_return(fake_response)

    service = GoogleGeocodeService.new(0, 0)
    expect(service.call).to be_nil
  end

  it "returns zipcode for given lat/lng" do
    response_body = {
      "results" => [
        {
          "address_components" => [
            { "long_name" => "500002", "types" => ["postal_code"] }
          ]
        }
      ]
    }
    fake_response = double(code: 200, parsed_response: response_body)
    allow(HTTParty).to receive(:get).and_return(fake_response)

    service = GoogleGeocodeService.new(17.385044, 78.486671)
    expect(service.call).to eq("500002")
  end
end
