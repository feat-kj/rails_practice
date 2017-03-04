class User < ApplicationRecord

  has_many :user_genres, dependent: :destroy
  has_many :genres, :through => :user_genres

  belongs_to :prefecture

  has_one :user_auth, dependent: :destroy, class_name: UserAuth
  accepts_nested_attributes_for :user_auth

  validates :name,:profile, :prefecture_id, :gender, presence: true

  # validate :valid_genres

  # def valid_genres
  #   errors.add(:genres, "must selected genre") if genres.size > 1
  # end
end
