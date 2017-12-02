class UserResponsesController < ApplicationController


  def new

  end

  def create
   user_answer = params[:answer]
   question_id = params[:survey_question_id]
    @user_response = UserResponse.create!(response: user_answer, survey_response_id: question_id, :user_id => current_user.id)
  end




end
