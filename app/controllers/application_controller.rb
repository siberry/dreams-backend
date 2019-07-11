class ApplicationController < ActionController::API
  def get_auth_header
    request.headers["Authorization"]
  end

  def decode_token
    begin
      JWT.decode(get_auth_header, Rails.application.credentials.auth_key)[0]["user_id"]
    rescue
      nil
    end
  end

  def encode_token(user)
    JWT.encode({user_id: user.id}, Rails.application.credentials.auth_key)
  end

  def session_user
    User.find_by(id: decode_token)
  end

end
