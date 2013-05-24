# Edit app/models/moviegoer.rb to look like this:
# class Moviegoer < ActiveRecord::Base
#   include ActiveModel::MassAssignmentSecurity
#   attr_protected :uid, :provider, :name # see text for explanation
#   def self.create_with_omniauth(auth)
#     Moviegoer.create!(
#       :provider => auth["provider"],
#       :uid => auth["uid"],
#       :name => auth["info"]["name"])
#   end
# end
# 
class Moviegoer < ActiveRecord::Base
  has_many :reviews
  has_many :movies, :through => :reviews
  include ActiveModel::MassAssignmentSecurity
  attr_protected :uid, :provider, :name # see text for explanation
  def self.create_with_omniauth(auth)
    moviegoer = Moviegoer.new
    moviegoer.provider = auth['provider']
    moviegoer.uid = auth['uid']
    moviegoer.name = auth['info']['name']
    moviegoer.save
    return moviegoer
  end
end
