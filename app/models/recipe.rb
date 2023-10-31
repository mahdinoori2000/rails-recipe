class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  validates :name, presence: true
  validates :quantity, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true
  validates :public, presence: true
end
