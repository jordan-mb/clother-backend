class StaticController < ApplicationController
  def the_delete
    PhotoTag.all.each { |pt| pt.destroy }
    Photo.all.each { |p| p.destroy }

    redirect_to root_path
  end
end
