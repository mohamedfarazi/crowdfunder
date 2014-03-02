class AddDescriptionToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :description, :text
  	add_column :comments, :title, :string
  	add_column :comments, :project_id, :integer
  	add_column :comments, :user_id, :integer
  	end
	end