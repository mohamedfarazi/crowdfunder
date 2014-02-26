class Breakpoint < ActiveRecord::Base
	belongs_to :project
	has_many :backers, :through => :pledges
end
