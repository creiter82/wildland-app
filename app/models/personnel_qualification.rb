class PersonnelQualification < ActiveRecord::Base
    belongs_to :personnel
    belongs_to :qualification
    
end
