class SurveysController < ApplicationController

  def index
    @questions = SurveyQuestion.order(:created_at).page params[:page]
    @answers = SurveyResponse.all
  end



end
