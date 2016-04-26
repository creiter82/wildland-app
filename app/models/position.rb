class Position < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true
    before_save :downcase_name
    
    def downcase_name
      self.name.downcase!
    end
    
end
