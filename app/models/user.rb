class User < ActiveRecord::Base
	has_secure_password
	validates :email, uniqueness: {case_sensitive: false, message: "already exists in our system"}
	has_many :projects, foreign_key: "owner_id"

	has_many :breakpoints, :through => :pledges
	has_many :pledges, foreign_key: "backer_id"
	has_many :comments, :through => :projects
	has_many :comments
end


