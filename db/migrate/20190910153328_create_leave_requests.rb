class CreateLeaveRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :leave_requests do |t|
    	t.date :from_date
    	t.date :to_date
    	t.string :reason
    	t.string :status, default: 'Applied'
    	t.references :user

    	t.timestamps
    end
  end
end
