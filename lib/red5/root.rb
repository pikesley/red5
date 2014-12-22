module Red_5
  class Root
    def self.all
      resource = RestClient::Resource.new "http://swapi.co/api/"
      JSON.parse resource.get.body
    end
  end
end
