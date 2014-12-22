module Red_5
  class People
    def self.find id
      resource = RestClient::Resource.new "http://swapi.co/api/people/#{id}"
      JSON.parse resource.get.body
    end
  end
end
