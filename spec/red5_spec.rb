require 'spec_helper'

module Red_5
  describe Root do
    it 'has vehicles' do
      root = Root.all
      expect(root.keys).to include 'films'
    end
  end
end
