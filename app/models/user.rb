class User < ActiveRecord::Base
	has_secure_password
	validates :email, uniqueness: {case_sensitive: false, message: "already exists in our system"}

	has_many :projects, foreign_key: "owner_id"

	has_and_belongs_to_many :pledges
end
