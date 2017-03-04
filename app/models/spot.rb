class Spot
  include ActiveModel::Model

  attr_accessor :prefecture_id, :genre_ids

  validate :valid_genre_ids

  def valid_genre_ids
    errors.add(:genre_ids, "must selected genre") if genre_ids.size > 1
  end

  def find_result(spot_form = SpotForm.new)
    url = "https://www.chiikinogennki.soumu.go.jp"

    search_ids = spot_form.genre_ids.map{|s|Integer s}
    genres = Genre.where(id: search_ids)
    keyword = "/"
    genres.each do |g|
      keyword << g.keyword << ";"
    end
    conn = Faraday.new(:url => url) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.response :json, :content_type => /\bjson$/
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    json_response = conn.get do |req|                           # GET http://sushi.com/search?page=2&limit=100
      req.url "/k-cloud-api/v001/kanko#{keyword}/json"
      req.params['limit'] = 50
      if spot_form.prefecture_id.present?
        pref = Prefecture.find(spot_form.prefecture_id)
        req.params['place'] = ERB::Util.url_encode(pref.name)
      end
      # req.params['count'] = true
    end
    results = JSON.parse(json_response.body)

    return results['tourspots']
  end
end
