module Red_5
  class Entities
    def self.find id
      slug = self.name.split('::').last.downcase
      resource = RestClient::Resource.new "http://swapi.co/api/#{slug}/#{id}"
      JSON.parse resource.get.body
    end
  end
end
