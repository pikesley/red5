module Red5
  class Entities
    def self.find id
      basename = self.name.split('::').last
      slug = basename.downcase
      resource = RestClient::Resource.new "http://swapi.co/api/#{slug}/#{id}"

      begin
        self.new JSON.parse resource.get.body
      rescue RestClient::ResourceNotFound
        id = "##{id}" if id.is_a? Numeric
        raise Red5Exception.new "#{basename.singularize} #{id} does not exist"
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
      @data[key] || raise(Red5Exception.new "No such attribute #{key}")
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
