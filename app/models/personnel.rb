class Personnel < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :personnel_qualifications, dependent: :destroy
  has_many :qualifications, through: :personnel_qualifications
  has_many :assignments, dependent: :destroy
  validates_presence_of :first_name, :last_name
  validates :phone,:presence => true,
                   :length => { :minimum => 10, :maximum => 10 }
                   
  def can_add_qual?(name)
    !qual_already_added?(name)
  end
  
  def qual_already_added?(name)
    qual = Qualification.find_by_name(name)
    return false unless qual
    personnel_qualifications.where(qualification_id: qual.id).exists?
  end
  
  def can_signup?(roster)
    !already_signed_up?(roster)
  end
  
  def already_signed_up?(roster)
    roster = Roster.find(roster)
    return false unless roster
    assignments.where(roster_id: roster.id).exists?
  end
  
  def is_qualified?(unfilled_pos)
    position = Position.find_by_name(unfilled_pos.name)
    if qualifications.where(acronym: "engb").exists? && position.name == "engine boss" ||  position.name == "firefighter #1"||  position.name == "firefighter #2"
      return true
    end
    if qualifications.where(acronym: "enop").exists? && position.name == "engine operator"
      return true
    end
    if qualifications.where(acronym: "fft1").exists? && position.name == "firefighter #1" || position.name == "firefighter #2"
      return true
    end
    if qualifications.where(acronym: "fft2").exists? && position.name == "firefighter #1" || position.name == "firefighter #2"
      return true
    end
  end
  
  
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
end
