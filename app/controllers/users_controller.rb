class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    preferences = {} #tag => value
    UserTag.where(:user_id => params[:id]).each do |ut|
      tag = Tag.find(ut.tag_id)
      tag = tag.name if tag
      preferences[tag] = ut.value
    end

    @preferences = preferences.sort_by {|k, v| v}.reverse
  end
end
