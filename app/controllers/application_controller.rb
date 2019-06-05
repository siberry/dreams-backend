class ApplicationController < ActionController::API
  def encode_token(user)
    JWT.encode({user_id: user.id}, "hide_this_please")
  end
end
