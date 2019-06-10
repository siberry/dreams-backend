class DreamsController < ApplicationController
  def index
    dreams = Dream.all.order(created_at: :desc)
    render json: dreams
  end

  def create
    dream = Dream.create(params.require(:dream).permit(:date, :hours_slept, :quality, :state_of_mind, :dream, :user_id))
    specific_tags = params.require(:tags).map { |tag_id| SpecificDreamTag.create(dream: dream, dream_tag_id: tag_id) }

    render json: dream
  end

  def show
    dream = Dream.find(params[:id])
    render json: dream
  end

  def update
    byebug
    dream = Dream.update()
  end

end
