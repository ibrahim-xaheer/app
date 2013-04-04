class UsersController < ApplicationController
  def new
  	@title = "Sign Up"
  	@user =User.new
  end

  def show
  	@user =User.find(params[:id])
  end

  def create

#  	raise params[:user].inspect
  	@user = User.new(params[:user])

  	if @user.save
  		#Handle a successfull sign up
      #redirect_to user_path(@user) # takes u to the user home page
      redirect_to @user
  	else
      @title = "Sign Up | ERROR "
  		render 'new'
  	end
  end

end
