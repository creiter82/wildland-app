class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_personnel!
  
  def after_sign_in_path_for(resource)
    rosters_path
  end
  
  private
  
    def is_admin?
       @personnel = current_personnel
       if @personnel.admin?
       else
           redirect_to(root_path)
           flash[:danger] = "Must be admin!"
       end
    end
  
end
