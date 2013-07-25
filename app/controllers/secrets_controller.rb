class SecretsController < ApplicationController
  def index
    respond_to do |format|
      format.html { render :index }
      format.json { render :json => Secret.all }
    end
  end

  def create

    params[:secret][:recipient] = User.find_by_id(params[:user_id])
    params[:secret][:author] = User.find_by_id(current_user.id)

    @secret = Secret.create!(params[:secret])

    render :nothing => true
  end

  def new
    @secret = Secret.new
    render :new
  end
end
