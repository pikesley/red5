require 'spec_helper'

module Red5
  describe Starships do
    it 'finds a starship', :vcr do
      starship = Starships.find 12
      expect(starship['model']).to eq 'T-65 X-wing'
    end

    context 'Failure' do
      it 'raises an exception on a non-existent thing', :vcr do
        expect{ Starships.find 999 }.to raise_exception do |exception|
          expect(exception).to be_a Red5Exception
          expect(exception.status).to eq 'Starship #999 does not exist'
        end
      end

      it 'raises an exception on a ludicrous request', :vcr do
        expect{ Starships.find 'lolwut' }.to raise_exception do |exception|
          expect(exception).to be_a Red5Exception
          expect(exception.status).to eq 'Starship lolwut does not exist'
        end
      end
    end
  end
end
