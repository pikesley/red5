require 'spec_helper'

module Red5
  describe Species do
    it 'finds a species', :vcr do
      species = Species.find 8 # Mon Calamari
      expect(species['classification']).to eq 'amphibian'
    end

    it 'finds a homeworld for a species', :vcr do
      species = Species.find 9
      expect(species['homeworld']).to eq 'http://swapi.co/api/planets/7/'
    end

    it 'fetches the homeworld for a species', :vcr do
      species = Species.find 3 # Wookie
      expect(species.fetch_homeworld['name']).to eq 'Kashyyyk'
    end
  end
end
