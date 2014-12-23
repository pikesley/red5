require 'spec_helper'

module Red5
  describe Films do
    it 'returns a film', :vcr do
      expect(Films.first.class).to eq Films
    end

    it 'finds a particular film', :vcr do
      film = Films.find 1
      expect(film['title']).to eq 'A New Hope'
      expect(film['episode_id']).to eq 4
    end
  end
end
