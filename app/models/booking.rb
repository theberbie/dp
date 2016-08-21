class Booking < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
 

  def send_booking_email
    BookingRequest.booking_requested(self).deliver
  end



end
