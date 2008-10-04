require File.dirname(__FILE__) + '/../test_helper'

class TaskTest < Test::Unit::TestCase
  fixtures :tasks

  # Replace this with your real tests.
  def test_truth
    assert true
  end

  def test_pdone_is_in_range
    task = Task.new(:tresc => "Something something",
                    :engeener => "Moryc",
                    :timetaken => 5)

    task.pdone = -10
    assert !task.valid?

    task.pdone = 50
    assert task.valid?

    task.pdone = 110
    assert !task.valid?
  end

  def test_timetaken_is_positive
    task = Task.new(:tresc => "Something",
                    :engeener => "Moryc",
                    :pdone => 10)

    task.timetaken = -10
    assert !task.valid?

    task.timetaken = 10
    assert task.valid?
  end


end
