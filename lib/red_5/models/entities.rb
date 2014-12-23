module Red5
  class Entities
    def self.find id
      slug = self.name.split('::').last.downcase
      resource = RestClient::Resource.new "http://swapi.co/api/#{slug}/#{id}"

      begin
        self.new JSON.parse resource.get.body
      rescue RestClient::ResourceNotFound
        require 'pry'
        binding.pry
        raise Red5Exception.new 'Entity does not exist'
      end
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

      case parts[0]
      when 'fetch'
          key = parts[1]
          url = self[key]

          unless url.is_a? Array
            expects_single_result = true
            url = [url]
          end

          results = []
          url.each do |u|
            results.push Red5.fetch_results u
          end

          return results.first if expects_single_result
          results
      end
    end
  end
end
