class ListItem < ApplicationRecord
  belongs_to :bill

  validates :name, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :amount, presence: true, numericality: { greater_than: 0 }

  scope :recent, -> { order(created_at: :desc) }
end
