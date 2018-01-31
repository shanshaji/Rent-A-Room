class NotificationMailer < ApplicationMailer

  
  def authorization(room)
    @room = room

    mail to: "#{room.user.email}", subject: "Your room has been authorized - #{room.name}"
  end

  
  def confirmation(booking)
    @booking = booking

    mail to: "#{booking.user.email}", subject: "Your room has been confirmed - #{booking.room.name}"
  end

  def approve(booking)
    @booking = booking

    mail to: "#{booking.room.user.email}", subject: "Approve the booking of - #{booking.room.name} for the dates #{booking.start_date}"
  end
  def welcome_email
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
