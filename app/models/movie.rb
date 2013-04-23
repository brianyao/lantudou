class Movie < ActiveRecord::Base
  def self.MPAA_ratings
  	return ['G','PG','PG-13','R']
  end
end
