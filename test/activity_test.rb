require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  attr_reader :activity

  def setup
    @activity = Activity.new("movies", { "Adrian" => 10.00, "Bob" => 12.00 })
  end

  def test_activity_class_exists
    assert_instance_of Activity, activity
  end

  def test_activity_has_a_name
    expected = "movies"
    actual = @activity.name

    assert_equal expected, actual
  end

  def test_activity_has_a_hash_with_participants_as_keys_and_amount_they_spent_as_values
    expected = { "Adrian" => 10.00, "Bob" => 12.00 }
    actual = @activity.participants

    assert_equal expected, actual
  end

  def test_total_cost_returns_the_sum_of_the_amount_spent_by_all_participants
    expected = 22.00
    actual = @activity.total_cost

    assert_equal expected, actual
  end

  def test_cost_per_person_returns_cost_per_person
    expected = 11.00
    actual = @activity.cost_per_person

    assert_equal expected, actual
  end

  def test_owed_amounts_returns_a_hash_with_keys_as_participants_and_their_owed_amount_for_values
    expected = { "Adrian" => -1.00, "Bob" => 1.00 }
    actual = @activity.owed_amounts

    assert_equal expected, actual
  end

end
