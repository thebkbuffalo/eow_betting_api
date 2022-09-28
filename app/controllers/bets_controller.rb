class BetsController < ApplicationController

  def new
  end

  def create
    binding.pry
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

  def sub_causes_for_dropdown

  end

end