require 'spec_helper'

module Red_5
  describe Vehicles do
    it 'finds a vehicle', :vcr do
      vehicle = Vehicles.find 18 # AT-AT
      expect(vehicle['manufacturer']).to match /Kuat Drive Yards/
    end
  end
end
