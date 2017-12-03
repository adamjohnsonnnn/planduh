class UserResponsesController < ApplicationController


  def new
  end

  def create
   user_answer = params[:answer]
   question_id = params[:survey_question_id]
    @user_response = UserResponse.create!(response: user_answer, survey_question_id: question_id, :user_id => current_user.id)
  end


  def destroy
    @user_responses = current_user.user_responses.all
    @user_responses.destroy
  end



end


    ##Will ajax on tuesday

    # if @user_response.save
    #   redirect_to survey_question_user_responses_path , :page => params[:page]
    # else
    #   flash[:notice] = "Something went wrong"
    # end
