class PagesController < ApplicationController
   skip_before_action :authenticate_personnel!
   
   def index
       
   end
    
end