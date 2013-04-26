class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def index
  end

  def create
  	@new_post = current_user.posts.build(params[:post])
    if @new_post.save
      flash[:success] = "Successfully Posted!"
	  redirect_to current_user	
    else
   	  flash[:failure] = "FAILED to Post"
      redirect_to current_user	
    end
  end

  def destroy
  end
end