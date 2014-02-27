module ProjectsHelper
	def total_pledges(project)
		total_pledges = 0;
		project.breakpoints.each do |bp|
			total_pledges += (bp.pledges.size * bp.amount_in_cents)
		end
		total_pledges
	end
end
