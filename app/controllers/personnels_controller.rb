class PersonnelsController < ApplicationController

  def index
    @personnels = Personnel.all
  end
  
  def destroy
     @personnel = Personnel.find(params[:id]) 
     @personnel.destroy
     flash[:danger] = "This person is going to be deleted"
     redirect_to personnels_path
  end
  
  
  private 
  
    def personnel_params
       params.require(:personnel).permit(:first_name, :last_name, :phone, 
                                         :email, :password) 
    end

end