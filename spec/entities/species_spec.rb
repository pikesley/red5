require 'spec_helper'

module Red_5
  describe Species do
    it 'finds a species', :vcr do
      species = Species.find 8 # Mon Calamari
      expect(species['classification']).to eq 'amphibian'
    end

    it 'gets the homeworld for a species', :vcr do
      species = Species.find 3 # Wookie
      expect(species.get_homeworld['name']).to eq 'Kashyyyk'
    end
  end
end
