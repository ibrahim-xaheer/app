class RelationshipsController < ApplicationController
  before_filter :signed_in_user

  def create
    @user = User.find(params[:relationship][:friend_id])
    current_user.make_friend!(@user)
    redirect_to @user
  end

  def destroy
    @user = Relationship.find(params[:id]).friend
    current_user.unfriend!(@user)
    redirect_to @user
  end
end