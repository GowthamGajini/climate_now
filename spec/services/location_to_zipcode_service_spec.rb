require 'rails_helper'

RSpec.describe LocationToZipcodeService do
  it "returns nil or error for an invalid location" do
    service = LocationToZipcodeService.new("")
    expect(service.call).to be_nil
  end

  it "returns the zipcode for a valid location" do
    service = instance_double(LocationToZipcodeService)
    allow(LocationToZipcodeService).to receive(:new).with("Bangalore").and_return(service)
    allow(service).to receive(:call).and_return("560002")

    expect(service.call).to eq("560002")
  end
end
