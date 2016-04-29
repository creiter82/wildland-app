class Qualification < ActiveRecord::Base
    has_many :personnel_qualifications
    has_many :personnels, through: :personnel_qualifications
    validates :name, presence: true, uniqueness: true
    validates :acronym, presence: true, uniqueness: true
    before_save :downcase_name, :downcase_acronym
    
    def downcase_name
      self.name.downcase!
    end
    
    def downcase_acronym
      self.acronym.downcase!
    end
    
    def name
      self[:name].titleize
    end
    
end
