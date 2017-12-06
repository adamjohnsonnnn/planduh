class SurveysController < ApplicationController

  def index
    @questions = SurveyQuestion.page(params[:page]).per(1)
    @answers = SurveyResponse.all
  end

  def show
  	@page = params[:id].to_i
  	if params[:id].to_i < 8
  		@question = SurveyQuestion.find(params[:id])
  	end
  end

end
