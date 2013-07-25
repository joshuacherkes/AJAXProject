class FriendshipsController < ApplicationController

  def create
    params[:friendship] = {}
    params[:friendship][:friend_id] = params[:user_id]
    params[:friendship][:user_id] = current_user.id
    @friendship = Friendship.create!(params[:friendship])
    render :nothing => true
  end

  def destroy
    params[:friendship] = {}
    params[:friendship][:friend_id] = params[:user_id]
    params[:friendship][:user_id] = current_user.id
    Friendship.delete_all(params[:friendship])
    render :nothing => true
  end

end
