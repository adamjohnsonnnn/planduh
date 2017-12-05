class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(secure_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to surveys_path
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def show
    redirect_unless_logged_in
    if find_and_ensure_user(params[:id])
      @user = User.find(params[:id])
      redirect_to "user/show/#{@user.id}"
    end
  end

  def index
  end

  private

  def secure_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
