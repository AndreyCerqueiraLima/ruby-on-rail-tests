class Company < ApplicationRecord
  validates :cnpj,:name, presence: true
  has_many :users
  belongs_to :user
end
