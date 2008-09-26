class StatusController < ApplicationController

  before_filter :authorize, :except => :home
  layout "status"

  def list
      @lenie = Engeener.find(:all)
  end

  def home

  end

  def report
    @lenie = Engeener.find(:all)
    @tasks = Task.find(:all)
  end

  def user
    @leniuch = Engeener.find(params[:id])
    nazwisko = @leniuch.nzwisko
    @task = Task.find(:all, :conditions => [ "engeener = ?", nazwisko])
  end

end
