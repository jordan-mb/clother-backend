class PhotosController < ApplicationController
  #before_filter :authenticate_user!

  def new
    @tags = Tag.all
  end

  def create
    file = params[:photo_file].tempfile.read
    puts file.inspect

		photo = Photo.new(params[:photo])
		photo.file = file

    if photo.save
      count = Tag.all.count
      (1..count).each do |x|
        if params["tag#{x}"]
          tag = Tag.find(x)
          if tag
            PhotoTag.create(
              :photo_id => photo.id,
              :tag_id => tag.id,
            )
          end
        end
      end

    else
      flash[:error] = "Photo did not save"
    end

    redirect_to root_path
  end

  def index
    @photos = Photo.all
  end

  def show_file
    photo = Photo.find(params[:id])
		send_data(photo.file, type: 'image/jpg', disposition: 'inline')
  end
end
