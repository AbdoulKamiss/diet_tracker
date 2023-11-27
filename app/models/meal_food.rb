class MealFood < ApplicationRecord
  belongs_to :meal
  belongs_to :food

  def quantity_count(quantity, var)
    count = ((quantity * var)/ 100)

    return count
  end
end
