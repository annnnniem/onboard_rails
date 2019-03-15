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

  def create_oath
    user_email = request.env['omniauth.auth'][:info][:email]
    user = User.find_by(email: user_email)
    if user?
      log_in user
    else
      @user = User.new(email: user_email, name: request.env['omniauth.auth'][:info][:name])
      if user.save? 
        redirect_to user
      else
        render 'new'
      end
  end

  def destroy
  	log_out
  	IntercomRails::ShutdownHelper::intercom_shutdown_helper(cookies)
  	render 'new'
  end
end
