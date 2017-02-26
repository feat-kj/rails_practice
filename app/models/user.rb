class User < ApplicationRecord

  has_many :user_genres
  has_many :genres, :through => :user_genres

  belongs_to :prefecture

  validates :name,:profile, :prefecture_id, :gender, presence: true

  #has_one :user_auths

end
