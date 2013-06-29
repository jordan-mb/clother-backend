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

  def destroy
    photo = Photo.find(params[:id])
		if photo
      photo.delete

      PhotoTag.all.each do |pt|
        if pt.photo_id == photo.id
          pt.delete
        end
      end
    end

		redirect_to photos_path
  end

  def love
    increment_value(params, true)
  end

  def hate
    increment_value(params, false)
  end

  def increment_value(params, direction)
    user_id = current_user.id
    tag_ids = []
    PhotoTag.where(:photo_id => params[:id]).each do |pt|
      tag_ids << pt.tag_id
    end

    tag_ids.each do |t|
      user_tag = UserTag.where(:tag_id => t, :user_id => user_id)
      if user_tag.length == 1
        if direction == true
          user_tag.first.value += 1
        elsif direction == false
          user_tag.first.value -= 1
        end
        user_tag.first.save
      else
        direction ? value = 1 : value = -1
        UserTag.create(
          :tag_id => t,
          :user_id => user_id,
          :value => value,
        )
      end
    end

    redirect_to photos_path
    #redirect to next image
  end
end
