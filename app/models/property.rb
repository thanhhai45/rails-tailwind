class Property < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :bills, dependent: :destroy

  validates :name, presence: true
end
