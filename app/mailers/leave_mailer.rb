class LeaveMailer < ApplicationMailer

	def send_request(leave, user)
		@leave_request = leave
		@user = user
		receipient = 'gajendar@dispatchtrack.com'
		subject = "Leave Request-#{user.name}"
		mail( to: receipient,
		  subject: subject
    )
	end

	def send_response(leave, admin)
		@leave = leave
    @admin = admin
		@user = @leave.user
		mail( to: @user.email,
			subject: 'Response for Leave'
		)
	end
end
