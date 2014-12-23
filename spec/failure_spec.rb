require 'spec_helper'

module Red5
  describe 'Failure' do
    context '404s' do
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

    context 'Non-existent attributes' do
      it 'raises an exception on a bogus lookup', :vcr do
        person = People.find 19
        expect{ person['favourite_food'] }. to raise_exception do |exception|
          expect(exception).to be_a Red5Exception
          expect(exception.status).to eq 'No such attribute favourite_food'
        end
      end
    end
  end
end
