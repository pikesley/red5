require 'spec_helper'

module Red_5
  describe Root do
    it 'has vehicles' do
      root = Root.all
      expect(root.keys).to include 'films'
    end
  end

  describe Films do
    it 'finds a film', :vcr do
      film = Films.find 1
      expect(film['title']).to eq 'A New Hope'
      expect(film['episode_id']).to eq 4
    end
  end

  describe People do
    it 'finds a person', :vcr do
      person = People.find 7 # Aunt Beru
      expect(person['eye_color']).to eq 'blue'
    end
  end

  describe Planets do
    it 'finds a planet', :vcr do
      planet = Planets.find 2
      expect(planet['name']).to eq 'Alderaan'
    end
  end

  describe Species do
    it 'finds a species', :vcr do
      species = Species.find 8 # Mon Calamari
      expect(species['classification']).to eq 'amphibian'
    end
  end
end
