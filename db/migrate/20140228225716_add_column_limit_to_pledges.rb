class AddColumnLimitToBreakpoints < ActiveRecord::Migration
  def change
  	add_column :breakpoints, :limit, :integer
  end
end
