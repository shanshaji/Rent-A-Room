class Room < ApplicationRecord

	has_many :amenities, through: :amenity_rooms
	belongs_to :user
  has_many :bookings
  has_many :special_prices
	validates_presence_of :name, :description, :price, :rules, :address, :city_id, :user_id
  #validates_numericality_of :latitude, :longitude
  validates_length_of :description, minimum: 150
  mount_uploaders :images, ImagesUploader
  serialize :images, JSON

  before_validation :set_lat_long
  after_save :set_user_host
  after_update :send_authorization

 def set_lat_long
  	
  url = "https://maps.googleapis.com/maps/api/geocode/json?"
	key = "AIzaSyAYqo8jZHqRasfakmw7T8TuI8mykNlx5Kk"


	
	response = HTTParty.get("#{url}address=#{self.address}&key=#{key}")
	location = response["results"][0]["geometry"]["location"]
	self.latitude = location["lat"]
	self.longitude = location["lng"]

  end
  def set_user_host 
  	if self.user.role.name == "admin"
  	else
  		self.user.update_attributes!(role_id:Role.second.id)
  	end
  	
  end

  def send_authorization
    if self.is_authorized == true
      NotificationMailer.authorization(self).deliver!
    end
  end
end
