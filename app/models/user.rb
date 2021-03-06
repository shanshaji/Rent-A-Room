class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :role
  has_many :rooms
  has_many :bookings
  has_many :reviews
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :username, :mobile, :role_id
  validates_numericality_of :mobile
  validates_length_of :mobile, is: 10
  
  
  devise :database_authenticatable, :authentication_keys => [:username]

  # callback

  before_validation :assign_guest_role

  def role?(role)
    self.role.name == role
  end 

  def assign_guest_role
    if self.role_id == 1
    elsif self.rooms.empty?
  	 self.role_id = Role.last.id
    elsif self.role.name == "guest"
      self.role_id = Role.second.id
    end
  end
end
