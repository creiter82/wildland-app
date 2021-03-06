class Apparatu < ActiveRecord::Base
  has_many :roster_apparatus
  has_many :rosters, through: :roster_apparatus
  has_many :apparatu_positions
  has_many :positions, through: :apparatu_positions
  validates :designator, presence: true, uniqueness: true
  validates_presence_of :name, :apparatus_class, :apparatus_type
  before_save :downcase_name, :downcase_designator, :downcase_apparatus_class
  
  def downcase_name
    self.name.downcase!
  end
  
  def downcase_designator
    self.designator.downcase!
  end
  
  def downcase_apparatus_class
    self.apparatus_class.downcase!
  end
  
  #def designator
  #  self[:designator].titleize
  #end
    
end
