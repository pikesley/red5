module Red_5
  class Planets
    def self.find id
      resource = RestClient::Resource.new "http://swapi.co/api/planets/#{id}"
      JSON.parse resource.get.body      
    end
  end
end
