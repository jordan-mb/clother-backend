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

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(current_user.id)

  	if @user.update_attributes(params[:user])
  		redirect_to root_path
  	else
  		render 'edit'
  	end
  end

  def users_awaiting_approval
    @users = []
    User.all.each do |u|
      @users << u if !u.approved?
    end
  end

  def approve
    user = User.find(params[:id])
    user.approved = true
    user.save!

    AdminMailer.approved(user).deliver

    redirect_to '/unapproved_users'
  end
end
