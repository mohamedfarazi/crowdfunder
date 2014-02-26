class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
    	t.references :breakpoint
    	t.references :project
    	t.references :backer
    	t.boolean :active
      t.timestamps
    end
  end
end
