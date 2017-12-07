class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(secure_params)
    @survey = SurveyQuestion.find(1)
    if @user.save
      session[:user_id] = @user.id
      redirect_to survey_path(@survey)
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def show
    if logged_in?
       @itineraries = current_user.itineraries.where(confirmed?: true)
       return  "users/show"
     else
      redirect_to new_session_path
    end
  end

  def index
  end

  private

  def secure_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :agreed)
  end

end
