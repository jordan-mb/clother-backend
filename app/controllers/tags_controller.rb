class TagsController < ApplicationController
  before_filter :authenticate_user!

  def new
    admin
    @tags = Tag.all
  end

  def create
    admin
    tags = params[:tags] if params[:tags]
    tags = tags.split(', ') if tags
    tags.each do |tag|
      tag = tag.downcase
      next if Tag.where(:name => tag).length > 0
      Tag.create(:name => tag)
    end

    redirect_to new_tag_path
  end

  def index
    admin
    @tags = Tag.all
  end

  def show
    admin
    @tag = Tag.find(params[:id])
  end

  def destroy
    admin
    tag = Tag.find(params[:id])
    if tag
      tag.delete

      PhotoTag.where(:tag_id => tag.id).each { |pt| pt.delete }
      UserTag.where(:tag_id => tag.id).each { |ut| ut.delete }
      CouponTag.where(:tag_id => tag.id).each { ct| ct.delete }
    end

    redirect_to tags_path
  end
end
