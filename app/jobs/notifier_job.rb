class NotifierJob < ApplicationJob
  queue_as :default
  
  def perform(booking)
  	if booking.is_confirmed == false
    	NotificationMailer.approve(booking).deliver!
    elsif booking.is_confirmed  == true
    	NotificationMailer.confirmation(booking).deliver!
	end
  end
end
