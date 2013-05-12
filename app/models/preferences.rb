class Preferences < ActiveRecord::Base
  attr_accessible :black, :blue, :brown, :green, :orange, :red, :white, :yellow, :dress, :short_dress, :long_dress, :strapless_dress, :tshirt, :pink

  belongs_to :user
end
