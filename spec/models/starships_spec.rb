require 'spec_helper'

module Red5
  describe Starships do
    it 'finds a starship', :vcr do
      starship = Starships.find 12
      expect(starship['model']).to eq 'T-65 X-wing'
    end
  end
end
