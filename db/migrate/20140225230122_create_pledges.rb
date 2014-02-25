class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
    	t.references :project
    	t.integer :amount_in_cents
    	t.text :description
    	t.string :title
      t.timestamps
    end
  end
end
