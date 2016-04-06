class QualificationsController < ApplicationController
    before_action :is_admin?
    
    def index
        @qualifications = Qualification.all
    end
    
    def new
        @qualification = Qualification.new
    end
    
    def create
        @qualification = Qualification.new(qual_params)
        if @qualification.save
            flash[:notice] = "Qual was created"
            redirect_to qualifications_path
        else
            render 'new'
        end
    end
    
    def edit
    
    end
    
    def update
    end
    
    def destroy
        @qualification = Qualification.find(params[:id])
        @qualification.destroy
        flash[:notice] = "#{@qualification.name} was deleted"
        redirect_to qualifications_path
    end
    
    private
    
        def qual_params
           params.require(:qualification).permit(:name, :acronym) 
        end


end