class ApplicationController < ActionController::API
  include JsonWebToken
  include ActionController::Cookies

  before_action :authenticate_request

  private
    def authenticate_request
      # header = request.headers["Authorization"]
      # header = header.split(" ").last if header
      jwt = cookies.signed[:jwt]
      puts("------ JWT ----- #{jwt}")
      decoded = jwt_decode(jwt)
      @current_user = User.find(decoded[:user_id])
    end
end
