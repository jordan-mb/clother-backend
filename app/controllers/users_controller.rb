class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    admin
    @users = User.all
  end

  def show
    admin
    @user = User.find(params[:id])

    @preferences = []
    @user.user_tags.each do |ut|
      @preferences << [Tag.find(ut.tag_id).name, ut.value]
    end
  end
end
