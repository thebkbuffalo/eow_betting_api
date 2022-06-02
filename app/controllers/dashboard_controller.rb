class DashboardController < ApplicationController
  before_action :authenticate_request

  def index
    render json: @current_user, status: :ok
  end
end
