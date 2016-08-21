class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  after_create :send_booking_email

  def send_booking_email
    BookingRequest.booking_requested(self).deliver
  end



end
