class StaticController < ApplicationController
  def the_delete
    PhotoTag.all.each { |pt| pt.destroy }
    Photo.all.each { |p| p.destroy }
  end
end
