class LoginController < ApplicationController

  before_filter :authorize, :except => [:login, :add_engeener]
  layout "default"

  def add_engeener
    @engeener = Engeener.new(params[:engeener])
    if request.post? and @engeener.save
      flash.now[:notice] = "User #{@engeener.nzwisko} created"
      @engeener = Engeener.new
    end
  end

  def login
    session[:engeener_id] = nil
    if request.post?
      engeener = Engeener.authenticte(params[:nzwisko], params[:password])
      if engeener
        session[:engeener_id] = engeener.id
        uri = session[:original_uri]
        session[:original_uri] = nil
        redirect_to(uri || { :action => "index" })
      #  redirect_to(:action => "index", :controller => "Login")
      else
        flash[:notice] = "Invalid user/password combination"
      end
    end
  end

  def logout
    session[:engeener_id] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end

  def edit
      @engeener = Engeener.find(params[:id])
  end

  def update
    @engeener = Engeener.find(params[:id])
    if @engeener.update_attributes(params[:engeener])
      redirect_to :action => 'user', :controller => 'status', :id => @engeener
    else
      render :action => 'edit'
    end
  end

  def index

  end

  def delete_engeener
  end

  def list_engeeners
    @all_users = Engeener.find(:all)
  end
end
