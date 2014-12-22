require 'spec_helper'

module Red_5
  describe People do
    it 'finds a person', :vcr do
      person = People.find 7 # Aunt Beru
      expect(person['eye_color']).to eq 'blue'
    end

    it 'gets the species for a person', :vcr do
      expect(People.get_species(15)['name']).to eq 'Rodian'
    end
  end
end
