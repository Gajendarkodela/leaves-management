class LeaveRequest < ApplicationRecord
	belongs_to :user, dependent: :destroy
	validates_presence_of :reason, :to_date, :from_date
	validates_uniqueness_of :to_date, :scope => [:from_date, :user_id]
	validate :to_date_greater_than_from, :no_past_date
	validate :max_leaves_reached

	scope :accepted_leaves, -> (user) { where('status = ? and user_id = ?', 'Accepted', user.id) }

	def to_date_greater_than_from
		if from_date > to_date
		  errors.add(:to_date, "can't be before from date")
		end
	end

	def no_past_date
		if from_date < Date.today
		  errors.add(:from_date, "Can not select past dates")
		end
	end

	def leave_period
		(to_date - from_date).to_i + 1
	end

	def max_leaves_reached
		if(new_record? && (user.leaves_taken.to_i + leave_period) > user.admin.max_leaves)
			errors.add(:to_date, "More than Limit! Can't apply for leave")
		end
	end
end