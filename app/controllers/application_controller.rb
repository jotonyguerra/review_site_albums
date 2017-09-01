class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  #how to redirect after sign out
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
