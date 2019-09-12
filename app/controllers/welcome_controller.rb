class WelcomeController < ApplicationController
	def index
		if current_user.admin?
		  redirect_to users_path
    else
    	redirect_to leave_requests_path
    end

	end
end