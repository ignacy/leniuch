class TaskController < ApplicationController
    layout "gray"

  # Show task details
  def show
    @task = Task.find(params[:id])
  end

  # Add new task TODO: dupplicates create
  def new
    @task = Task.new
  end

  # Create new task
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

  # Edit task
  def edit
    @task = Task.find(params[:id])
  end

  # Update task
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to :action => 'list', :controller => 'status', :id => @task
    else
      render :action => 'edit'
    end
  end

  # Delete task
  def delete
    Task.find(params[:id]).destroy
    redirect_to :action => 'list', :controller => 'status'
  end
end
