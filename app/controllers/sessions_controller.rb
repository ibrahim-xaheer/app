class SessionsController < ApplicationController
  def new
  	@title = "Sign In"
  end

  def create

   	user = User.find_by_email(params[:session][:email])

    if user && user.authenticate(params[:session][:password])#user Found
      sign_in user
	    redirect_to (user)
  	else#user not found
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
   	 	render 'new'
      # take to please re-enter details page later
  	end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
