class AddCpfDateBirthToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :document_number, :string
    add_column :users, :birthdate, :date
    add_column :users, :name, :string
    add_column :users, :gender, :string, limit: 1
  end
end
