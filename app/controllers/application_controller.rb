class ApplicationController < ActionController::API
  include JsonWebToken
  include ActionController::Cookies
  before_action :authenticate_request

  def format_bets_response(bets)
    if bets.present?
      payload = bets.map do |bet|
        # sub_cause = bet.sub_cause.present? ? bet.sub_cause.title : 'no sub cause'
        main_cause = bet.main_cause
        sub_cause = bet.sub_cause_id.present? ? bet.sub_cause : nil
        {
          bet_id: bet.id, 
          user_name: bet.user.full_name,
          main_cause_id: main_cause.id,
          main_cause: main_cause.title,
          sub_cause_id: sub_cause.present? ? sub_cause.id : nil,
          sub_cause: sub_cause.present? ? sub_cause.title : 'No sub cause',
          timeframe_years: bet.timeframe_years.to_s,
          timeframe_months: bet.timeframe_months.to_s,
          amount: bet.amount,
          main_cause_usage_count: main_cause.count,
          sub_cause_usage_count: sub_cause.present? ? sub_cause.count : nil
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
