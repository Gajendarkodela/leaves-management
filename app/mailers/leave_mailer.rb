class LeaveMailer < ApplicationMailer

	def send_request(leave, user)
		@leave_request = leave
		@user = user
		receipient = user.admin.email
		subject = "Leave Request-#{user.name}"
		mail( to: receipient,
			from: "#{user.name} <no-reply@leaves.com>",
		  subject: subject
    )
	end

	def send_response(leave, admin)
		@leave = leave
    @admin = admin
		@user = @leave.user
		mail( to: @user.email,
			from: "#{admin.name} <no-reply@leaves.com>",
			subject: 'Response for Leave'
		)
	end
end
