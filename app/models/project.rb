class Project < ActiveRecord::Base

belongs_to :user
has_many :users, through: :pledges
has_many :pledges
end
