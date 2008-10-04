# This is task object it describes things that engeeners are doing
# Fields:
# :tresc
# :pdone
# :engeener
# :timetaken
# For details check migrtions 002,005
# TODO: Change engeener so it's relational data from engeeners table
class Task < ActiveRecord::Base

  validates_presence_of :tresc, :pdone, :timetaken

  validates_numericality_of :pdone, :timetaken

  protected
  def validate
    errors.add(:pdone, "Should be at least 0%") if pdone < 0
    errors.add(:pdone, "Can't be more then 100%") if pdone > 100
    errors.add(:timetaken, "Should be at least 0") if timetaken < 0
    errors.add(:timetaken, "Should be less then 40") if timetaken > 40
  end

end
