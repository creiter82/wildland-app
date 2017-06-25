class AssignmentsController < ApplicationController
    
   def index
       Assignment.create(apparatu_id: params[:apparatu_id], roster_id: 
                                      params[:roster_id], 
                                             personnel: current_personnel, 
                                             position_id: params[:position_id])
       redirect_to roster_path(params[:roster_id])
   end 
   
   def create
      @assignment = Assignment.new(assignment_params(params[:assignment]))
      #@assignment.personnel = current_personnel
      already_signed_up = Assignment.find_by(roster_id: @assignment.roster.id, personnel_id: @assignment.personnel.id)
      if already_signed_up
         flash[:danger] = "You can only signup once per Roster"
         redirect_to :back
      elsif @assignment.save
         flash[:notice] = "You are signed up"
         redirect_to :back
         # add elsif if not using create.js
         #along with flash notice and redirect
      end
   end
   
   def update
      @assignment = Assignment.find(params[:id])
      if @assignment.update(assignment_params(params))
         if @assignment.deploy?
            flash[:notice] = "#{@assignment.personnel.full_name.titleize} was deployed"
            redirect_to :back
         else
            flash[:danger] = "#{@assignment.personnel.full_name.titleize} was taken off of deployment"
            redirect_to :back
         end
      else
         flash[:danger] = "Unable to deploy #{@assignment.personnel.full_name.titleize}"
         redirect_to :back
      end
   end
   
   def destroy
      @assignment = Assignment.find(params[:id])
      @assignment.destroy
      #respond_to do |format|
        #format.html { redirect_to roster_url(@assignment.roster_id), notice: "#{@assignment.personnel.full_name} was removed from #{@assignment.roster.name.titleize}" }
      #end 
      redirect_to :back, notice: "#{@assignment.personnel.full_name.titleize} was removed from #{@assignment.roster.name.titleize}"
   end
   
   private
      def assignment_params(params)
         params.permit(:id, :apparatu_id, :roster_id, :position_id, :personnel_id, :deploy, :alternate)
      end
end