class ApplicationController < ActionController::Base
	include SessionsHelper

	def home
		render 'pages/home'
	end
end