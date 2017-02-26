class User < ApplicationRecord

  has_many :user_genres
  has_many :genres, :through => :user_genres

  validates :name,:profile, :prefecture_id, :gender, presence: true

end
