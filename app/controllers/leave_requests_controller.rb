class LeaveRequestsController < ApplicationController
	before_action :set_leave, except: [:index, :new, :create, :respond_request]
	skip_before_action :verify_authenticity_token, only: [:respond_request]
	before_action :authenticate_admin, only: [:respond_request]
  
  # Here in the controller create, edit new update actions are xhr type
	def index
		@leaves = current_user.leave_requests
	end

	def show
	end

	def new
		@leave = current_user.leave_requests.new
	end

	def create
		@leave = current_user.leave_requests.new(leave_params)
    if  @leave.save
    	@leaves = current_user.leave_requests
    	LeaveMailer.send_request(@leave, current_user).deliver
    end
	end

	def edit
	end

	def update
		if @leave.update(leave_params)
			@leaves = current_user.leave_requests
			LeaveMailer.send_request(@leave, current_user).deliver
		end
	end

	def respond_request
		leave_request = LeaveRequest.find_by_id(params[:id])
		if leave_request.blank?
			msg = "Request is canceled by user. No need to Respond"
		end
    if params[:respond] == 'accept'
    	leave_request.status = 'Accepted'
    else
    	leave_request.status = 'Rejected'
    end

    if leave_request.save
    	LeaveMailer.send_response(leave_request, current_user).deliver
    	msg = "Successfully #{leave_request.status} the leave"
    end
    redirect_to users_path, notice: msg
	end

	def destroy

		if @leave.status == 'Applied' && @leave.destroy
			msg = 'Leave Request is Canceled Successfully'
		else
			msg = 'Something went wrong'
		end
		  redirect_to leave_requests_path,notice: msg
	end


	private
	def set_leave
		@leave = current_user.leave_requests.find(params[:id])
	end

	def leave_params
		params.require(:leave_request).permit!
	end

end