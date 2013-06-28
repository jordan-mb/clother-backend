class PhotosController < ApplicationController
  before_filter :authenticate_user!

  def new
    @photo = Photo.new
  end

  def create
    file = params[:photo].delete(:file).read

		@photo = Photo.new(params[:photo])
		@photo.file = file

		if @photo.save
			flash[:success] = "Your photo has been successfully uploaded!"
			redirect_to root_path
		else
			flash[:error] = "Well, that didn't work! Care to try again? (Your file might be too big)"
			render 'new'
		end
  end
end
