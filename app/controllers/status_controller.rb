require 'csv'

class StatusController < ApplicationController

  before_filter :authorize, :except => :home
  layout "gray"

  # Returns all engeeners
  def list
      @lenie = Engeener.find(:all)
  end

  def home

  end

  def help

  end

  # Returns all engeeneres and tasks
  def report
    @lenie = Engeener.find(:all)
    @tasks = Task.find(:all)
  end

  # User info page. All tasks.
  def user
    @leniuch = Engeener.find(params[:id])
    nazwisko = @leniuch.nzwisko
    @task = Task.find(:all, :conditions => [ "engeener = ?", nazwisko])
  end

  # Exports daily report to CSV file
  def export_toCSV

    #get all engeeners and tasks from db
    @lenie = Engeener.find(:all)
    @tasks = Task.find(:all)

    #generate report file
    CSV.open('public/reports/dailystatus.csv', 'w') do |writer|
      @lenie.each do |l|
        writer << [l.imie + " " +  l.nzwisko]
        writer << ['Task -- description', 'Time taken in hours']
        @tasks.each do |t|
          if t.engeener == l.nzwisko
            writer << [t.tresc, t.timetaken]
          end
        end
        writer << [nil, nil]
      end
    end

    #send the file to user
    send_file 'public/reports/dailystatus.csv'


  end

end
