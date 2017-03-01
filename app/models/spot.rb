class Spot
  include ActiveModel::Model

  def find_result
    url = "https://www.chiikinogennki.soumu.go.jp"
    conn = Faraday.new(:url => url) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.response :json, :content_type => /\bjson$/
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    json_response = conn.get do |req|                           # GET http://sushi.com/search?page=2&limit=100
      req.url '/k-cloud-api/v001/kanko/%E8%A1%8C%E4%BA%8B%E3%83%BB%E7%A5%AD%E4%BA%8B/json'
      req.params['limit'] = 50
      # req.params['count'] = true
    end
    results = JSON.parse(json_response.body)
    return results['tourspots']
    # spots = []
    # for num in 1..100 do
    #   dummy = {}
    #   dummy[:name] = "test"
    #   spots.push(dummy)
    # end
    #
    # return spots
  end
end
