class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:username])

    if user && user.authenticate(params[:password])
      user.token = SecureRandom.hex
      user.save!
      render json: { access_token: user.token, token_type: 'bearer' }
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end
end
