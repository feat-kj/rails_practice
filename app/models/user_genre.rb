class UserGenre < ApplicationRecord

  belongs_to :users

  belongs_to :genres

end
