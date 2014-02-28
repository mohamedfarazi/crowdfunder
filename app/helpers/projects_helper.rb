module ProjectsHelper
	include ActsAsTaggableOn::TagsHelper

	def total_pledges(project)
		total_pledges = 0;
		project.breakpoints.each do |bp|
			total_pledges += (bp.pledges.size * bp.amount_in_cents)
		end
		total_pledges
	end

	def display_money(n_cents)
		number_to_currency(n_cents.to_f/100, precision: 0)
	end

	def backed_bp(user, project)
		if user.backed_projects.include?(project)
			return user.breakpoints.where(project: project)[0]
		else
			return false
		end
	end
end
