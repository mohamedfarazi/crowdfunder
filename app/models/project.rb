class Project < ActiveRecord::Base
scope :newest_first, -> { order(created_at: :desc) }
belongs_to :owner, class_name: "User"
has_many :backers, :through => :pledges
has_many :breakpoints
has_many :pledges
has_many :comments


acts_as_taggable

end
