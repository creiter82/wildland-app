class Apparatu < ActiveRecord::Base
    validates :designator, presence: true, uniqueness: true
    validates_presence_of :apparatus_class, :apparatus_type
    before_save :downcase_designator, :downcase_apparatus_class
    
    def downcase_designator
      self.designator.downcase!
    end
    
    def downcase_apparatus_class
      self.apparatus_class.downcase!
    end
    
end
