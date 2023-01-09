class Movie < ActiveRecord::Base
  has_many :reviews
  has_many :critics, through: :reviews

  # Try out your methods here
  
end