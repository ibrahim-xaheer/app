class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user,   only: [:edit, :update]
  
  def new
  	@title = "Sign Up"
  	@user =   User.new
  end

  def show
  	@user =User.find(params[:id])
  end

  def create

#  	raise params[:user].inspect
  	@user = User.new(params[:user])

  	if @user.save
  		#Handle a successfull sign up
      #redirect_to user_path(@user) # takes u to the user home page\
      flash[:success] = "Welcome to Facebook"
      redirect_to @user
  	else
      @title = "Sign Up | ERROR "
  		render 'new'
  	end
  end

  def edit
    #@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
      @users = User.paginate(page: params[:page])
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

end
