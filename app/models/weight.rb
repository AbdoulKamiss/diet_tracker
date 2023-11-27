class Weight < ApplicationRecord
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
    weight = Weight.where("id > ?", id).order(id: :asc).first
    weight.present? ? weight : Weight.first
  end

  def previous
    weight = Weight.where("id < ?", id).order(id: :desc).first
    weight.present? ? weight : Weight.last
  end
end
