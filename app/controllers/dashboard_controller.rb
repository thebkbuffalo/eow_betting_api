class DashboardController < ApplicationController
  before_action :authenticate_request

  def index
    if params[:user_id].present?
      bets = Bet.where(user_id: params[:user_id])
      payload = format_bets_response(bets)
      render json: {bets: payload}
    else
      render json: 'user not found', status: :ok
    end
  end
end
