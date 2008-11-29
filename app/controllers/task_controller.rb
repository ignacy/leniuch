class TaskController < ApplicationController
    layout "gray"

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    nazwisko = @task.engeener
    ziom = Engeener.find(:first, :conditions => ["nzwisko = ?", nazwisko])

    if @task.save
      redirect_to :action => 'list', :controller => 'status', :id => ziom.id
    else
      render :action => 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to :action => 'list', :controller => 'status', :id => @task
    else
      render :action => 'edit'
    end
  end

  def delete
    Task.find(params[:id]).destroy
    redirect_to :action => 'list', :controller => 'status'
  end
end
