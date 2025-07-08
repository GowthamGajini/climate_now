class LocationToZipcodeService
  def initialize(location)
    @location = location
  end

  def call
    return nil if @location.blank?

    coords = GooglePlacesService.new(@location).call
    return nil unless coords

    GoogleGeocodeService.new(coords[:lat], coords[:lng]).call
  end
end
