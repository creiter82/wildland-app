class Personnel < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :personnel_qualifications, dependent: :destroy
  has_many :qualifications, through: :personnel_qualifications
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
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
end
