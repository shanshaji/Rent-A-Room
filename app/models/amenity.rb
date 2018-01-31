class Amenity < ApplicationRecord
	has_many :rooms, through: :amenity_rooms
	validates_presence_of :name, :description
	validates_length_of :description, within: 10...1000
end
