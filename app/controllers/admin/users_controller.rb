class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all.order(last_name: :desc)
  end

  def search
    @users = User.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  def show
    @user = User.find(params[:id])
    @conditions = User.find(params[:id]).conditions
  end
end
