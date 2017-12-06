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
    redirect_unless_logged_in
     @itineraries = current_user.itineraries
    if find_and_ensure_user(params[:id])
     return  "users/show"
    else
      return '404'
    end
  end

  def index
  end

  private

  def secure_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :agreed)
  end

end
