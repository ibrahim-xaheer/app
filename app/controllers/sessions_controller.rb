class SessionsController < ApplicationController
  def new
  	@title = "Sign In"
  end

  def create

  	user = User.find_by_email(params[:session][:email])

  	if user && user.authenticate(params[:session][:password])#user Found
	    redirect_to (user)
  	else#user not found
  		 flash.now[:error] = 'Invalid email/password combination' # Not quite right!
   	 	render 'new'
  	end
  end

  def destroy
  end
end
