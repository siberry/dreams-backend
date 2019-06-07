class DreamsController < ApplicationController
  def index
    dreams = Dream.all
    render json: dreams
  end

  def create
    dream = Dream.create(params.require(:dream).permit(:date, :hours_slept, :quality, :state_of_mind, :dream, :user_id))
    specific_tags = params.require(:tags).map { |tag_id| SpecificDreamTag.create(dream: dream, dream_tag_id: tag_id) }

    render json: dream
  end

end
