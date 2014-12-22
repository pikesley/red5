require 'spec_helper'

module Red_5
  describe Root do
    it 'should have vehicles' do
      root = Root.all
      expect(root.keys).to include 'films'
    end
  end

  describe Planets do
    it 'should find a planet', :vcr do
      planet = Planets.find 2
      expect(planet['name']).to eq 'Alderaan'
    end
  end

  describe People do
    it 'should find a person', :vcr do
      person = People.find 7
      expect(person['eye_color']).to eq 'blue'
    end
  end
end
