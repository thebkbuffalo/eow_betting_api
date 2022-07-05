class HomeController < ApplicationController

  skip_before_action :authenticate_request, only: [:index]

  def index
    bets = Bet.all.reverse.last(10)
    payload = format_bets_response(bets)
    render json: {bets: payload}
  end

end
