class SpecialPrice < ApplicationRecord
	belongs_to :room
	validates_presence_of :start_date, :end_date, :price, :room_id
	validates_numericality_of :price, :room_id 
	validate :check_date, on: :create
	validate :check_special_price_dates, on: :create

	def check_date
		if self.start_date < Date.today
			self.errors.add(:base, "startdate must be greater than todays date")
		end
		if (self.end_date < self.start_date)
			self.errors.add(:base, "end date must be greter than start date")
		end
	end

	def check_special_price_dates
		current_dates = (self.start_date..self.end_date).to_a

		past_special_date = SpecialPrice.where('room_id=?', self.room_id)
		past_special_date.each do |past|
			all_past_special_dates = (past.start_date..past.end_date).to_a

			current_dates.each do |date|
				if all_past_special_dates.include?(date)
					self.errors.add(:base, "Room already has a special price for the #{date} " )
					break
				end
			end
		end
	end

end
