class CreatePledgesBackers < ActiveRecord::Migration
  def change
    create_table :pledges_backers, id: false do |t|
    	t.integer :pledge_id
    	t.integer :user_id
    end
  end
end
