class Position < ActiveRecord::Base
    has_many :apparatu_positions
    has_many :apparatus, through: :apparatu_positions
    validates :name, presence: true, uniqueness: true
    before_save :downcase_name
    
    def downcase_name
      self.name.downcase!
    end
    
end
