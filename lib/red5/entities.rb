module Red_5
  class Entities
    def self.find id
      slug = self.name.split('::').last.downcase
      resource = RestClient::Resource.new "http://swapi.co/api/#{slug}/#{id}"
      self.new JSON.parse resource.get.body
    end

    def self.first
      self.find 1
    end

    def initialize data
      @data = data
      @data['id'] = @data['url'].split('/').last.to_i
    end

    def [] key
      @data[key]
    end

    def method_missing method_name, *args
      mname = method_name.to_s
      parts = mname.split('_')

      if parts[0] == 'get'
        key = parts[1]
        url = self[key]
        r = RestClient::Resource.new url
        b = r.get.body
        j = JSON.parse b
        j
      end
    end
  end
end
