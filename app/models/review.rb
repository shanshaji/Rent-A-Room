class Review < ApplicationRecord
	belongs_to :room
	belongs_to :user
	validates_presence_of :review_body
end
