class Roster < ActiveRecord::Base
  has_many :roster_apparatus
  has_many :apparatus, through: :roster_apparatus
  has_many :assignments
  before_save :downcase_name
  validates :name, presence: true
  validates :start_time, presence: true, uniqueness: true
  validates :end_time, presence: true, uniqueness: true
  
  def downcase_name
    self.name.downcase!
  end
    
end
