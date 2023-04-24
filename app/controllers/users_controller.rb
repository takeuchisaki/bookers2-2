class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @book = Book.new
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
   
    @book = Book.new
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user == current_user
      redirect_to user_path(current_user)
    end
  end

end
