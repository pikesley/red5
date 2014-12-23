module Red_5
  class People < Entities
    def method_missing method_name, *args
      mname = method_name.to_s
      parts = mname.split('_')

      if parts[0] == 'get'
        JSON.parse (RestClient::Resource.new self[parts[1]][0]).get.body
      end
    end
  end
end
