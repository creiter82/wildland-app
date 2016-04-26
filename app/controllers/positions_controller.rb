class PositionsController < ApplicationController
    
    def new
        @position = Position.new
    end
    
    def create
        @position = Position.new(pos_params)
        @position.save
    end
    
    def destroy
        @position = Position.find(params[:id])
        @position.destroy
    end
    
    private
    
        def pos_params
            params.require(:position).permit(:name)
        end
    
end
