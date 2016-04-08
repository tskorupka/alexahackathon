class UsersController < ApplicationController
  skip_before_filter :authenticate
  def create
    @user = User.create user_hash: params[:user_hash]
  end

  def show
    @user = User.find_by user_hash: params[:id]
  end
end
