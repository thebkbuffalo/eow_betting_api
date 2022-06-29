class DashboardController < ApplicationController
  before_action :authenticate_request

  def index
    if params[:user_id].present?
      bets = Bet.where(user_id: params[:user_id])
      payload = {bets: bets, status: :ok}
      render json: payload
    else
      render json: 'this user has no bets', status: :ok
    end
  end
end
