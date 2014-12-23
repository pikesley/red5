module Red_5
  class People < Entities
    def get_species
      r = RestClient::Resource.new self['species'][0]
      z = r.get.body
      JSON.parse z
    end

    def method_missing method_name, *args
      mname = method_name.to_s

      parts = mname.split('_')

      if parts[0] == 'get'

      end
    end
  end
end
