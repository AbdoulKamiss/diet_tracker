class Fasting < ApplicationRecord
    validate :start_time_must_be_before_end_time

    def start_time_must_be_before_end_time
        errors.add(:start_time, "must be before end time") if start_time >= end_time
    end

    def fast_period
        period = (end_time - start_time).to_i 
    
        hours = period / 3600
        minutes = (period % 3600) / 60
        seconds = period % 60
    
        formatted_period = "#{hours}h #{minutes}m #{seconds}s"
        return formatted_period
    end

end
