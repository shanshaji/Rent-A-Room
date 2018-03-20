class Booking < ApplicationRecord
	belongs_to :room
	belongs_to :user

	validates_presence_of :start_date, :end_date 

	validate :check_booking,on: :create
	validate :check_dates,on: :create
	before_save :submit_price
	after_save :approve_booking
	after_update :send_confirmation

	def check_dates
		if self.start_date < Date.today
			self.errors.add(:error, "Todays date is #{Date.today}. You're not a time traveller ")
		end
		if self.end_date < self.start_date
			self.errors.add(:error,"Please dont. stop playing with the app.")
		end
	end

	def check_booking
		current_booking = (self.start_date..self.end_date).to_a

		past_booking = Booking.where('room_id=?', self.room_id)
		past_booking.each do |past|
			all_past_booking = (past.start_date..past.end_date).to_a

			current_booking.each do |date|
				if all_past_booking.include?(date)
					self.errors.add(:base, "Room already booked for the #{date} " )
					break
				end
			end
		end

	end
	

	def submit_price
		self.price=0
		current_dates =(self.start_date..self.end_date).to_a
		special_dates = SpecialPrice.where('room_id=?', self.room_id)
		current_dates.each do |date|
			temp=0
			special_dates.each do |special|
				special_price_dates = (special.start_date..special.end_date).to_a
				if special_price_dates.include?(date)
					temp =special.price
					break;
				else
					temp =self.room.price
				end
			end
			self.price += temp
		end
	end

	def send_confirmation
		NotifierJob.perform_later(self)   
  	end
  	def approve_booking
  		NotifierJob.perform_later(self)
  	end
end
