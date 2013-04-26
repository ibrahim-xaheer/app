class PagesController < ApplicationController


  def home
    if signed_in?
      @user =current_user
      redirect_to @user
    else
  	   @title = "Home"
       @user =User.new
    end
  end

  def contact
  	@title = "Contact"
  end
  
  def about
  	@title = "About"
  end
  
end
