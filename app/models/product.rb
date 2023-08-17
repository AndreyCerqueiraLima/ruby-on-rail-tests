class Product < ApplicationRecord
  belongs_to :company

  searchable do
    text :name, stored: true
    float :price, stored: true
    integer :quantity, stored: true
    integer :company_id, stored: true
  end

end

