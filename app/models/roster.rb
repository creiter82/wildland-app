class Roster < ActiveRecord::Base
  has_many :roster_apparatus
  has_many :apparatus, through: :roster_apparatus
  before_save :downcase_name
  
  def downcase_name
    self.name.downcase!
  end
    
end
