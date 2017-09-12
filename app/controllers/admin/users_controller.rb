class Admin::UsersController < ApplicationController
  before_action :authenticate_user!, :ensure_admin!


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to admin_users_path
  end

  private
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?(@user)
  end

  def user_params
      params.require(:user).permit(:email, :password,
                                   :password_confirmation)
  end

  def ensure_admin!
    unless current_user.admin?
      flash[:notice] = 'Not an admin, user signed out and redirected'
      sign_out current_user

      redirect_to root_path

      return false
    end
  end

end
