class AddRoleToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :integer, defualt: 0
  end
end
