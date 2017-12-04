class UserResponsesController < ApplicationController


  def new
  end

  def create
   next_page = params[:survey_question_id].to_i + 1
   current_page = params[:survey_question_id].to_i

   user_answer = params[:answer]
   question_id = params[:survey_question_id]

    @user_response = UserResponse.new(response: user_answer, survey_question_id: question_id, :user_id => current_user.id)

    if @user_response.save
      redirect_to "/surveys?page=#{next_page}"
    else
      @errors = @user_response.errors.full_messages
      flash[:warning] = "It looks like you have already answered this question. Please click next to continue!"
      redirect_to "/surveys?page=#{current_page}"
    end
  end


  def destroy
    @user_responses = current_user.user_responses.all
    @user_responses.destroy
  end

end

