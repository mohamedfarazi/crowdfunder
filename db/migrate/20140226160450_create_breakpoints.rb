class CreateBreakpoints < ActiveRecord::Migration
  def change
    create_table :breakpoints do |t|
      t.integer :project_id
      t.integer :amount_in_cents
      t.text :description
      t.string :title

      t.timestamps
    end
  end
end
