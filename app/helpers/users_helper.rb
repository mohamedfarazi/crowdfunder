module UsersHelper
def total_raised
	raised = 0
	current_user.breakpoints.each do |x|
		raised += x.amount_in_cents
	end
	raised
end

end
