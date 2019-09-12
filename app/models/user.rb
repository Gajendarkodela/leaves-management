class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  has_many :leave_requests
  belongs_to :admin, optional: true

  def admin?
  	type == 'Admin'
  end

  def leaves_taken
  	LeaveRequest.accepted_leaves(self).map(&:leave_period).inject{|i,l| i+l}
  end

  def leaves_balance
    (admin.max_leaves.to_i - leaves_taken.to_i)
  end

end
