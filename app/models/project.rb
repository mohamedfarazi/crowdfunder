class Project < ActiveRecord::Base

belongs_to :owner, class_name: "User"
has_many :backers, :through => :pledges, :source => :user
has_many :breakpoints
end
