class Food < ApplicationRecord
    has_many :meal_foods, dependent: :destroy
    has_many :meals, through: :meal_foods
end
