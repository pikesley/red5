module Red5
  def self.fetch_results url
    r = RestClient::Resource.new url
    b = r.get.body
    j = JSON.parse b
    j
  end
end
