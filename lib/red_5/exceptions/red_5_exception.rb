module Red5
  class Red5Exception < Exception
    attr_reader :status

    def initialize status
      @status = status
    end
  end
end
