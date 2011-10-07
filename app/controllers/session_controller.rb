class SessionController < ApplicationController
  before_filter :user_signed_in?, :only => [:delete]
  
  def new
    @title = "Login"
  end
  
  def create
    if user = User.find_by_AIMS_no(params[:session][:AIMS_no]).try(:authenticate, params[:session][:password])
    session[:user_id] = user.id
    redirect_to root_path # Or whatever you want i.e. redirect_to user
    else
      flash.now.alert = "Invalid AIMS or password"
      render 'new'      
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to login_path, :notice => "Logged out!"
  end 
 
end

