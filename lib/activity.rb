class Activity

  attr_reader :name,
              :participants,
              :cost_per_person,
              :owed_amounts

  def initialize(name, participants)
    @name = name
    @participants = participants
    @cost_per_person = calculate_average_cost
    @owed_amounts = calculate_owed
  end

  def total_cost
    @participants.values.reduce(0) do |total, amount|
      total += amount
    end
  end

  def calculate_average_cost
    total_cost/(@participants.keys.length)
  end

  def calculate_owed
    owed = {}
    @participants.each_pair do |participant, amount|
      owed[participant] = amount - cost_per_person
    end
    owed
  end

end
