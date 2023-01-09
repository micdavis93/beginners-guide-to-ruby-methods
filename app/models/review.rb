class Review < ActiveRecord::Base
  belongs_to :movie
  belongs_to :critic

  # Try out your methods here

end