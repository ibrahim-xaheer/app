class RelationshipsController < ApplicationController
  before_filter :signed_in_user

  def create
    @user = User.find(params[:relationship][:friend_id])
    current_user.make_friend!(@user)
    respond_to do |format|
  format.html { redirect_to @user }
  format.js
end
  end

  def destroy
    @user = Relationship.find(params[:id]).friend
    current_user.unfriend!(@user)
    respond_to do |format|
    format.html { redirect_to @user }
    format.js
    end
  end
end