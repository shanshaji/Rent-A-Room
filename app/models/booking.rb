class Booking < ApplicationRecord
	belongs_to :room
	belongs_to :user

	before_save :check_booking

	def check_booking

	end
end
