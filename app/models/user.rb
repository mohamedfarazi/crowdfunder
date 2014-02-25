class User < ActiveRecord::Base
	has_secure_password
	validates :email, uniqueness: {case_sensitive: false, message: "already exists in our system"}
end
