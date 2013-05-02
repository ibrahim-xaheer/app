class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy, :friends, :adders]
  before_filter :correct_user,   only: [:edit, :update]
  
  def new
  	@title = "Sign Up"
  	@user =   User.new
  end

  def show

  	@user =User.find(params[:id])
    @title = "#{@user.fName} #{@user.lName}"
    @posts = @user.posts.paginate(page: params[:page])
    @new_post = current_user.posts.build if signed_in?
  end

  def create

#  	raise params[:user].inspect
  	@user = User.new(params[:user])

  	if @user.save
  		#Handle a successfull sign up
      #redirect_to user_path(@user) # takes u to the user home page\
      flash[:success] = "Welcome to Facebook"
      sign_in(@user)
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

  def search
     @users = User.where("fName LIKE '%#{params[:search][:s_string]}%' OR lName LIKE '%#{params[:search][:s_string]}%'") .paginate(page: params[:page])
     @title = params[:search][:s_string]
     render 'results'   
     #
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User DELETED !!!"
    redirect_to users_url
  end

  def friends
      @title = "Friends"
      @user = User.find(params[:id])
      @users = @user.friend_users.paginate(page: params[:page])
      render 'friends'
    end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    

    def adders
      @title = "Adders"
      @user = User.find(:params[:id])
      @users = @user.adders.paginate(page: params[:page])
      render 'show_friends'
    end

end
