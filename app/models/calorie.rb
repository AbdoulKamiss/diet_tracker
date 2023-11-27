class Calorie < ApplicationRecord

  def calculate_average
    days = [monday, tuesday, wednesday, thursday, friday, saturday, sunday].reject { |value| value == 0}
    total = days.sum
    count = days.count
    average = total.to_f / count.to_f

    return average
  end

    def max_value
      maxi = [monday, tuesday, wednesday, thursday, friday, saturday, sunday].max

      return maxi
    end

    def min_value
      mini = [monday, tuesday, wednesday, thursday, friday, saturday, sunday].reject { |value| value == 0}
      
      if mini.empty?
        return 0
      else
        return mini.min
      end
    end
  
    def next
      calorie = Calorie.where("id > ?", id).order(id: :asc).first
      calorie.present? ? calorie : Calorie.first
    end
  
    def previous
      calorie = Calorie.where("id < ?", id).order(id: :desc).first
      calorie.present? ? calorie : Calorie.last
    end
  end
  