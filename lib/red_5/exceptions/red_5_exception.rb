module Red_5
  class Red5Exception < Exception
    attr_reader :status

    def initialize status
      @status = status
    end
  end
end
