class Movie < ActiveRecord::Base
  RATINGS = %w[G PG PG-13 R NC-17]  #  %w[] shortcut for array of strings
  @@grandfathered_date = Date.parse('1 November 1968')
  validates :title, :presence => true
  validates :release_date, :presence => true
  validate :released_1930_or_later # uses custom validator below
  validates :rating, :inclusion => {:in => RATINGS}, :unless => :grandfathered?
  before_save :capitalize_title
  
  def capitalize_title
    self.title = self.title.split(/\s+/).map(&:downcase).
      map(&:capitalize).join(' ')
  end

  def self.MPAA_ratings
	return RATINGS
  end

  # def released_1930_or_later
  #   errors.add(:release_date, 'must be 1930 or later') if
  #     self.release_date < Date.parse('1 Jan 1930')
  # end

  # def grandfathered? ; self.release_date >= @@grandfathered_date ; end
  def released_1930_or_later
    errors.add(:release_date, 'must be 1930 or later') if
      self.release_date != nil && self.release_date < Date.parse('1 Jan 1930')
  end

  def grandfathered?
    self.release_date != nil && self.release_date <= @@grandfathered_date
  end
   
end
