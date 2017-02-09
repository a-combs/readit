class SessionsController < ApplicationController
	skip_before_action :send_to_login_unless_logged_in

  def new
  end

  def create
  	user = User.find_by(username: params[:username])
    
  	respond_to do |format|
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id 
  		format.html { redirect_to posts_path, notice: "#{user.username} is now logged in."}
  	else
  		@error = "Your username and password combination is not valid"
  		format.html { render :new }
  		end
  	end
  end

  def destroy
  	session[:user_id] = nil
  	respond_to do |format|
  		format.html { redirect_to login_path, notice: "You have been logged out , you loser!"}
  	end
  end
end