require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test

  attr_reader :reunion

  def setup
    activities = [Activity.new("movies", { "Adrian" => 10.00, "Bob" => 12.00 })]
    @reunion = Reunion.new("Philadelphia", activities)
  end

  def test_reunion_class_exists
    assert_instance_of Reunion, @reunion
  end

  def test_reunion_has_a_location
    expected = "Philadelphia"
    actual = @reunion.location

    assert_equal expected, actual
  end

  def test_reunion_has_activities
    assert_instance_of Activity, @reunion.activities.first
  end

  def test_add_activity_adds_an_activity_to_reunions_activities_array
    @reunion.add_activity(Activity.new("drinks", { "Adrian" => 20.00, "Bob" => 12.00 }))

    assert_equal 2, @reunion.activities.count
    assert_instance_of Activity, @reunion.activities[0]
    assert_instance_of Activity, @reunion.activities[1]
  end

  def test_grand_total_returns_the_sum_of_all_activities_total_cost
    @reunion.add_activity(Activity.new("drinks", { "Adrian" => 20.00, "Bob" => 12.00 }))
    expected = 54.00
    actual = @reunion.grand_total

    assert_equal expected, actual
  end

  def test_total_cost_per_person_returns_total_average_cost_per_person
    @reunion.add_activity(Activity.new("drinks", { "Adrian" => 20.00, "Bob" => 12.00 }))
    expected = 27.00
    actual = @reunion.total_cost_per_person

    assert_equal expected, actual
  end

  def test_owed_amounts_returns_hash_with_participants_as_keys_and_their_owed_amount_as_values
    @reunion.add_activity(Activity.new("drinks", { "Adrian" => 20.00, "Bob" => 12.00 }))
    expected = { "Adrian" => -3.00, "Bob" => 3.00 }
    actual = @reunion.owed_amounts

    assert_equal expected, actual
  end

end
