module Red_5
  class People < Entities

    def self.get_species id
      data = self.find id
      species = data['species']
      resource = RestClient::Resource.new species[0]
      j = JSON.parse resource.get.body
      j['name']
    end
  end
end
