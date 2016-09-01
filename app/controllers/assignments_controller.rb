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
      @assignment.personnel = current_personnel
      @assignment.save
   end
   
   
   private
      def assignment_params(params)
         params.permit(:apparatu_id, :roster_id, :position_id)
      end
end