class UsersController < ApplicationController
  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      token = encode_token(user)

			render json: {user: UserSerializer.new(user), token: token}
    else
      render json: {errors: "username or password is incorrect"}
    end

     # does this work??
    # render json: user && user.authenticate(params[:password])
  end

  def create
		user = User.new(
			username: params[:username],
			password: params[:password]
		)
		if user.save
			token = encode_token(user)

			render json: {user: UserSerializer.new(user), token: token}
		else
			render json: {errors: user.errors.full_messages}
		end
	end

  def auto_login
    user = session_user
    if user
      render json: user
    else
      render json: {errors: "User not logged in"}
    end
  end
end
