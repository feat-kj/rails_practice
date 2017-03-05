class User < ApplicationRecord

  has_many :user_genres, dependent: :destroy
  has_many :genres, :through => :user_genres

  belongs_to :prefecture

  has_one :user_auth, dependent: :destroy, class_name: UserAuth
  accepts_nested_attributes_for :user_auth

  # validate
  validates :name,:profile, :prefecture_id, :gender, presence: true

  validates :name, length:{ maximum: 20}
  validates :profile, length:{ maximum: 100}

  validates :prefecture_id, inclusion: { in: 1..47 }
  validates :gender, inclusion: { in: 1..2 }

end
