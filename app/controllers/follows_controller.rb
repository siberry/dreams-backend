class FollowsController < ApplicationController
  def create
    follow = Follow.create(params.require(:follow).permit(:user_id, :followed_id))

    render json: follow
  end
end
