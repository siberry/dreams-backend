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
    dream_tag.update(change_image: params.require("change_image"), img_url: "")
  end

  # def get_dreams_by_letter
  #   dream_tags = DreamTag.all.select { |tag|
  #     tag.tag_name.start_with?(params[:letter].upcase)
  #   }
  #
  #   render json: dream_tags
  # end
end
