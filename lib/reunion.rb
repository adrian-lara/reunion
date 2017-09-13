class Reunion

  attr_reader :location,
              :activities,
              :total_cost_per_person,
              :owed_amounts

  def initialize(location, activities)
    @location = location
    @activities = activities
    @total_cost_per_person = calculate_average_cost
    @owed_amounts = calculate_owed
  end

  def add_activity(activity)
    @activities << activity
  end

  def grand_total
    @activities.reduce(0) do |grand_total, activity|
      grand_total += activity.total_cost
    end
  end

  def calculate_average_cost
    individuals = @activities.first.participants.keys
    require 'pry'
    binding.pry
    grand_total/(individuals.count)
  end

  def calculate_owed

  end

end
