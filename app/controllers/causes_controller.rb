class CausesController < ApplicationController

  def new
  end

  def create
    if causes_params['mainCauseId'].blank? #create new cause and associated subcause(if present)
      new_main_cause = MainCause.new(title: causes_params['mainCauseTitle'], description: causes_params['mainCauseDescription'])
      if new_main_cause.save
        new_main_cause.sub_causes.create(title: params['subCauseTitle'], description: causes_params['subCauseDescription'])
      end
    else # add sub cause to existing main cause
      main_cause = MainCause.find(causes_params['mainCauseId'])
      main_cause.sub_causes.create(title: params['subCauseTitle'], description: causes_params['subCauseDescription'])
    end
  end

  # private
    def causes_params
      return params['cause']
    end

end