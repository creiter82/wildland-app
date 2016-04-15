class PagesController < ApplicationController
   skip_before_action :authenticate_personnel!
   
   def index
      @rosters = Roster.all    
   end
    
end