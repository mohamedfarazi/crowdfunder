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

	def display_money_short(n_cents)
		if n_cents < 10000000
			number_to_currency(n_cents.to_f/100, precision: 0)
		elsif n_cents < 100000000
			number_to_currency(n_cents.to_f/100000, precision: 0) + "K"
		else
			number_to_currency(n_cents.to_f/100000000, precision: 0) + "M"
		end
	end

	def backed_bp(user, project)
		if user.backed_projects.include?(project)
			return user.breakpoints.where(project: project)[0]
		else
			return false
		end
	end

	def time_to_close(project)
		distance_of_time_in_words(project.end_date - Time.now) if Time.now < project.end_date
	end
end
