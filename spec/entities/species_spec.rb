require 'spec_helper'

module Red_5
  describe Species do
    it 'finds a species', :vcr do
      species = Species.find 8 # Mon Calamari
      expect(species['classification']).to eq 'amphibian'
    end
  end
end
