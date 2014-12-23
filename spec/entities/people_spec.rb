require 'spec_helper'

module Red_5
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

    it 'gets the species for a person', :vcr do
      person = People.find 15 # Greedo
      expect(person.get_species['name']).to eq 'Rodian'
    end
  end
end
