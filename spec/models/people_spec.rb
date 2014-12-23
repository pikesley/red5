require 'spec_helper'

module Red5
  describe People do
    it 'returns a person', :vcr do
      person = People.find 1
      expect(person.class).to eq People
    end

    it 'finds a particular person', :vcr do
      person = People.find 7 # Aunt Beru
      expect(person['eye_color']).to eq 'blue'
    end

    it 'has an id', :vcr do
      person = People.find 13
      expect(person['id']).to eq 13
    end

    it 'fetches the species for a person', :vcr do
      person = People.find 15 # Greedo
      expect(person.fetch_species[0]['name']).to eq 'Rodian'
    end

    it 'finds ALL THE PEOPLE', :vcr do
      expect(People.all.count).to eq 82
    end
  end
end
