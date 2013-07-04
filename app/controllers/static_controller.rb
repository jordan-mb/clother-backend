class StaticController < ApplicationController
  def make_jo_admin
    jos = User.where(:email => "jo.mravca@gmail.com")
    jo = jos[0]
    jo.admin = true
    jo.save!

    redirect_to root_path
  end
end
