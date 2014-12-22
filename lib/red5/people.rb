module Red_5
  class People < Entities
    def self.get_species id
      JSON.parse((RestClient::Resource.new (self.find(id))['species'][0]).get.body)
    end
  end
end
