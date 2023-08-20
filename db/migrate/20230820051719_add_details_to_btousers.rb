class AddDetailsToBtousers < ActiveRecord::Migration[7.0]
  def change
    add_column :btousers, :name, :string
    add_column :btousers, :nickname, :string
    add_column :btousers, :phone, :string
    add_column :btousers, :address, :string
  end
end
