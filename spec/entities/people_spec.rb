require 'spec_helper'

module Red_5
  describe People do
    it 'finds a person', :vcr do
      person = People.find 7 # Aunt Beru
      expect(person['eye_color']).to eq 'blue'
    end
  end
end
