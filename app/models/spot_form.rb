class SpotForm
  include ActiveModel::Model

  attr_accessor :prefecture_id, :genre_ids

  validate :valid_genre_ids

  def valid_genre_ids
    errors.add(:genre_ids, "must selected genre") if genre_ids.size > 1
  end
end
