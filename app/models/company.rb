class Company < ApplicationRecord
  validates :cnpj,:name, presence: true
  has_many :users, dependent: :delete_all
  has_many :products, dependent: :delete_all
  belongs_to :user
end
