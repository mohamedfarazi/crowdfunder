class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :user_id
      t.integer :goal_in_cents
      t.datetime :start_date
      t.datetime :end_date
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
