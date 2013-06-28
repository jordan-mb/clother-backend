class PhotosController < ApplicationController
  before_filter :authenticate_user!

  def new
    @tags = Tag.all
  end

  def create
    file = params[:photo_file].tempfile.read

		photo = Photo.new(params[:photo])
		photo.file = file

    if photo.save
      Tag.all.each do |tag|
        if params["tag#{tag.id}"]
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

  def update_tags
    photo = Photo.find(params[:id])
    if photo

      PhotoTag.all.each do |pt|
        if pt.photo_id == photo.id
          pt.delete
        end
      end

      Tag.all.each do |tag|
        if params["tag#{tag.id}"]
          if tag
            PhotoTag.create(
              :photo_id => photo.id,
              :tag_id => tag.id,
            )
          end
        end
      end
    end

    redirect_to photos_path
  end

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
    @tags = Tag.all

    @checked = {}
    @tags.each do |tag|
      if @photo.tags.include?(tag)
        @checked[tag.id] = true
      else
        @checked[tag.id] = nil
      end
    end
  end

  def show_file
    photo = Photo.find(params[:id])
		send_data(photo.file, type: 'image/jpg', disposition: 'inline')
  end
end
