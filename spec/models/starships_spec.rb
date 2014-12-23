require 'spec_helper'

module Red_5
  describe Starships do
    it 'finds a starship', :vcr do
      starship = Starships.find 12
      expect(starship['model']).to eq 'T-65 X-wing'
    end

    context 'Failure' do
      it 'raises an exception on a non-existent thing', :vcr do
        expect(Starships.find 999).to raise Red_5::Red5Exception
      end
    end
  end
end
