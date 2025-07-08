require 'rails_helper'

RSpec.describe LocationToZipcodeService do
  it "returns nil or error for an invalid location" do
    service = LocationToZipcodeService.new("")
    expect(service.call).to be_nil
  end
end
