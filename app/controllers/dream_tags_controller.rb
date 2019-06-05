class DreamTagsController < ApplicationController
  def index
    dream_tags = DreamTag.all.order(tag_name: :asc)
    render json: dream_tags
  end

  def show
    dream_tag = DreamTag.find(params[:id])
    render json: dream_tag
  end

  def update
    dream_tag = DreamTag.find(params[:id])
    dream_tag.update(change_image: params.require("change_image"))
  end
end
