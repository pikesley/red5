require 'spec_helper'

module Red5
  describe Root do
    it 'has vehicles' do
      root = Root.all
      expect(root.keys).to include 'vehicles'
    end

    it 'has OpenStruct-type lookups'
  end
end
