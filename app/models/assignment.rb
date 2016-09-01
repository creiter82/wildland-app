class Assignment < ActiveRecord::Base
   belongs_to :apparatu
   belongs_to :personnel
   belongs_to :roster
   belongs_to :position
    
end