class Meal < ApplicationRecord
    has_many :meal_foods, dependent: :destroy
    has_many :foods, through: :meal_foods

    def total_calories
        total = 0
        meal_foods.each do |meal_food|
          total += meal_food.food.calories * meal_food.quantity
        end
        total
    end
end
