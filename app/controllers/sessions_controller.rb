class SessionsController < ApplicationController

  def create
    @email = params[:"/login"][:email]
    user = User.find_by(email: @email.strip.downcase)
    
    if user = User.authenticate_with_credentials(@email.strip.downcase, params[:"/login"][:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
