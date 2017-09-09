class Admin::UsersController < ApplicationController
  before_action :authorize_admin!

  def index
    @users = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    # redirect_to users_url
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


end
