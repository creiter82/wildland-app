class Personnel < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :first_name, :last_name
  validates :phone,:presence => true,
                   :length => { :minimum => 10, :maximum => 10 }
                   
  def full_name
    "#{first_name} #{last_name}"
  end
  
end
