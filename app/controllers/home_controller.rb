class HomeController < ApplicationController

  skip_before_action :authenticate_request, only: [:index]

  def index
    bets = Bet.limit(10).includes(:user, :main_cause, :sub_cause)
    payload = format_bets_response(bets)
    render json: {bets: payload}
  end

  # def is_logged_in
  #   binding.pry
  # end

end
