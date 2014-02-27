class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    session[:return_to] = request.referrer
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to session[:return_to], :notice => "Registration successful!"
      session[:return_to] = nil
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  def show
    @user = current_user
  end

  def destroy
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
