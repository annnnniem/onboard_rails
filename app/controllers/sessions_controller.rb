class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.password == params[:session][:password]
  		log_in user
  		redirect_to user
  	else
  		flash.now[:danger] = 'Invalid email/password combination'
  		render 'new'
  	end
  end

  def destroy
  	log_out
  	IntercomRails::ShutdownHelper::intercom_shutdown_helper(cookies)
  	render 'new'
  end
end
