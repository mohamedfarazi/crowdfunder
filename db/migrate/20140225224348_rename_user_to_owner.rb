class RenameUserToOwner < ActiveRecord::Migration
  def change
  	change_table :projects do |t|
  		t.rename :user_id, :owner_id
  	end
  end
end
