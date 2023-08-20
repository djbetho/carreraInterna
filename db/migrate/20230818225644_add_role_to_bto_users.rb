class AddRoleToBtoUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :btousers, :role, :integer, default: 0
  end
end
