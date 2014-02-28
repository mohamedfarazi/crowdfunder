class SessionsController < ApplicationController
  def new
  	session[:return_to] = request.referrer
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user and user.authenticate(params[:password])
       user.last_logged_in = DateTime.now
       user.save
      session[:user_id] = user.id
  		redirect_to session[:return_to], :notice => "Login successful!"
  		session[:return_to] = nil
  	else
  		flash.now[:alert] = "Invalid email or password"
  		render "new"
  	end
  end

  def destroy
  	session[:return_to] = request.referrer
  	session[:user_id] = nil
  	redirect_to session[:return_to], :notice => "Logged out!"
  	session[:return_to] = nil
  end
end
