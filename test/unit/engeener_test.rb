require File.dirname(__FILE__) + '/../test_helper'

class EngeenerTest < Test::Unit::TestCase
  fixtures :engeeners

  # Replace this with your real tests.
  def test_truth
    assert true
  end

  def test_invlid_with_emty_attributes
    engeener = Engeener.new
    assert !engeener.valid?
    assert engeener.errors.invalid?(:nzwisko)
  end

end
