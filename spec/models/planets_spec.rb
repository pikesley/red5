require 'spec_helper'

module Red_5
  describe Planets do
    it 'finds a planet', :vcr do
      planet = Planets.find 2
      expect(planet['name']).to eq 'Alderaan'
    end
  end
end
