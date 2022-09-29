class BetsController < ApplicationController

  def new
  end

  def create
    new_bet = params['bet']
    new_bet['amount'] = new_bet['amount'].to_i
    if Bet.create(bet_params)
      render json: {message: 'new bet created', status: :created}
    else
      render json: {message: 'something went wrong', status: response.status}
    end
  end

  def all_causes_for_dropdown
    main_causes = MainCause.all
    @payload = main_causes.map do |cause|
      sub_causes = cause.sub_causes
      cause = cause.attributes
      cause['subs'] = sub_causes
      cause
    end
    render json: {causes: @payload}, status: :ok
  end

  def main_causes_for_dropdown
    @main_causes = MainCause.all
    render json: {main_causes: @main_causes, status: :ok} 
  end

  private
    def bet_params
      params.require(:bet).permit(:user_id, :main_cause_id, :sub_cause_id, :timeframe, :amount)
    end

end