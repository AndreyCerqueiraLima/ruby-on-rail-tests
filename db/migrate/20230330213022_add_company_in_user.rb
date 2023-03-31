class AddCompanyInUser < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :users,:company,index: true
  end
end
