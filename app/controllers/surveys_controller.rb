class SurveysController < ApplicationController

  def index
    @questions = SurveyQuestion.page(params[:page]).per(1)
    @answers = SurveyResponse.all

    # render action: :index, layout: request.xhr? == nil
  end



end
