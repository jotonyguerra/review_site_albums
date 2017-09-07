class Admin::UsersController < ApplicationController
  before_action :authorize_admin!

  def index
    @users = User.all
  end

  def admin?
    role == "admin"
  end

end
#need to refactor
#stolen from namespacing_with_tdd
