class Spot
  include ActiveModel::Model

  attr_accessor :prefecture_id, :genre_ids

  validate :valid_genre_ids

  def valid_genre_ids
    errors.add(:genre_ids, "お気に入りを一つ選択してください") if genre_ids.size > 1
  end

  def find_result(spot_form = SpotForm.new)
    # ToDo あとで設定ファイルに移動
    url = "https://www.chiikinogennki.soumu.go.jp"

    search_ids = spot_form.genre_ids.map{|s|Integer s}
    if search_ids.size == 0
      return []
    end
    genres = Genre.where(id: search_ids)
    keyword = "/"
    genres.each do |g|
      keyword << g.keyword << ";"
    end
    conn = Faraday.new(:url => url) do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.response :json, :content_type => /\bjson$/
      faraday.adapter  Faraday.default_adapter
    end
    json_response = conn.get do |req|
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
