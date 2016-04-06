class PersonnelsController < ApplicationController
    before_action :is_admin?, only: [:destroy]
    before_action :able_to_edit,   only: [:edit, :update]

  def index
    @personnels = Personnel.all
  end
  
  def edit
      @personnel = Personnel.find(params[:id])
  end
  
  def update
      @personnel = Personnel.find(params[:id])
      
      if params[:personnel][:password].blank?
        params[:personnel].delete(:password)
        params[:personnel].delete(:password_confirmation)
      end

      if @personnel.update(personnel_params)

        flash[:success] = "#{@personnel.full_name} was updated successfully"

        redirect_to personnels_path

      else

        render 'edit'

      end
  end
      
  def destroy
     @personnel = Personnel.find(params[:id]) 
     @personnel.destroy
     flash[:danger] = "#{@personnel.full_name} has been deleted?"
     redirect_to personnels_path
  end
  
  
  private 
  
    def personnel_params
       params.require(:personnel).permit(:first_name, :last_name, :phone, 
                                         :email, :password, :admin) 
    end
    
    def able_to_edit
        @personnel = Personnel.find(params[:id])
        #redirect_to(personnels_path) unless current_personnel?(@personnel) || current_personnel.admin?
        if current_personnel?(@personnel) || current_personnel.admin?
        else
            redirect_to(personnels_path) 
            flash[:danger] = "You are not authorized to edit others"
        end
    end
    
    def is_admin?
       @personnel = Personnel.find(params[:id])
       if @personnel.admin?
       else
           redirect_to(personnels_path)
           flash[:danger] = "Must be Admin to delete personnel"
       end
    end
    
    def current_personnel?(personnel)
        personnel == current_personnel
    end


end