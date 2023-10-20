class UsersController < ApplicationController
  
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    # is_matching_login_user
    @user = User.find(params[:id])
    # unless user.id == current_user.id
    #   redirect_to edit_user_path(current_user.id)
    # end
  end
  
  def update
    # is_matching_login_user
    @user = User.find(params[:id])
    # unless user.id == current_user.id
    #   redirect_to edit_user_path(current_user.id)
    # end
    
    if @user.update(user_params)
      flash[:notice] = "User was successfully updated."
    redirect_to user_path(@user)
    else
      render :edit
    end    
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end
end
