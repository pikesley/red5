require 'spec_helper'

module Red_5
  describe Films do
    it 'finds a film', :vcr do
      film = Films.find 1
      expect(film['title']).to eq 'A New Hope'
      expect(film['episode_id']).to eq 4
    end
  end
end
