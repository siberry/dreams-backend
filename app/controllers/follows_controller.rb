class FollowsController < ApplicationController
  def create
    follow = Follow.create(params.require(:follow).permit(:user_id, :followed_id))
    user = User.find(params.require(:user_id))

    render json: user
  end

  def destroy
    follow = Follow.find(params[:id])
    user = follow.follower
    follow.destroy

    render json: user
  end
end
