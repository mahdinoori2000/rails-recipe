class Recipe < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :quantity, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true
  validates :public, presence: true
end
