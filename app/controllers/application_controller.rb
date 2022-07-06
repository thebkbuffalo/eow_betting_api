class ApplicationController < ActionController::API
  include JsonWebToken
  include ActionController::Cookies
  before_action :authenticate_request

  def format_bets_response(bets)
    if bets.present?
      payload = bets.map do |bet|
        sub_cause = bet.sub_cause.present? ? bet.sub_cause.title : 'no sub cause'
        {
          bet_id: bet.id, 
          user_name: bet.user.full_name,
          main_cause_id: bet.main_cause_id,
          main_cause: bet.main_cause.title,
          sub_cause_id: bet.sub_cause_id,
          sub_cause: sub_cause, 
          timeframe: bet.timeframe,
          amount: bet.amount
        }
      end
    else
      payload = 'You have no bets'
    end
    return payload
  end

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
