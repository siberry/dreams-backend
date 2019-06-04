class DreamTagsController < ApplicationController
  def index
    dream_tags = DreamTag.all
    render json: dream_tags
  end
end
