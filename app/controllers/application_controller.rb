class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_personnel!
  
  private
  
    def is_admin?
       @personnel = Personnel.find(params[:id])
       if @personnel.admin?
       else
           redirect_to(personnels_path)
           flash[:danger] = "Must be Admin to delete personnel"
       end
    end
  
end
