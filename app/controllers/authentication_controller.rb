class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request
  include ActionController::Cookies

  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
      # render json: {token: token, user: @user}, status: :ok
      cookies.signed[:jwt] = {value: token, httponly: true, same_site: :none}
      puts("JWT TOKEN IN COOKIE --- #{cookies.signed[:jwt]}")
      render json: {user: @user, loggedIn: true}
    else
      render json: {error: 'unauthorized', loggedIn: false}, status: :unauthorized
    end
  end
end
