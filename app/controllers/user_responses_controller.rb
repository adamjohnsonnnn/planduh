class UserResponsesController < ApplicationController


  def new
  end

  def create
   next_page = params[:survey_question_id].to_i + 1

   user_answer = params[:answer]
   question_id = params[:survey_question_id]

    @user_response = UserResponse.create(response: user_answer, survey_question_id: question_id, :user_id => current_user.id)

      redirect_to "/surveys/#{next_page}"
  end


  def destroy
    @user_responses = current_user.user_responses.all
    @user_responses.destroy
  end






end

