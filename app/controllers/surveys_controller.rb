class SurveysController < ApplicationController

  def index
    @questions = SurveyQuestion.page(params[:page]).per(1)
    @answers = SurveyResponse.all
  end

  def show
    id = params[:id].to_i % 7
  	@question = SurveyQuestion.find_by(order: id)
    @page = @question.order
    render 'show'
  end

  def new
    survey = SurveyQuestion.find_by(order: 1)
    redirect_to survey_path(survey)
  end

end
