namespace :breakpoints do
	desc "set limit of rewards to 0 for all breakpoints where limit is nil"
	task :update_limits => :environment do
		breakpoints = Breakpoint.where(limit: nil)
		breakpoints.each do |bp|
			bp.limit = 0
			if bp.save
				puts "#{bp.title} was updated"
			else
				puts "There was a problem updating #{bp.title} with id #{bp.id}"
			end
		end
	end
end