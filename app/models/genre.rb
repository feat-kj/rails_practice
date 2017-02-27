class Genre < ApplicationRecord

  belongs_to :categories
  has_many :category, :through => :categories

  has_many :user_genres
  has_many :users, :through => :user_genres

end
