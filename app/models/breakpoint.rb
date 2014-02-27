class Breakpoint < ActiveRecord::Base
	scope :by_price, -> { order(amount_in_cents: :asc) }
	belongs_to :project
	has_many :backers, :through => :pledges
	has_many :pledges
end
