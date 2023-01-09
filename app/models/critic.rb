class Critic < ActiveRecord::Base
  has_many :reviews
  has_many :movies, through: :reviews

  # Try out your methods here

end