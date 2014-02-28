class AddColumnIntoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :intro, :boolean
  end
end
