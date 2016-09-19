class Booking < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :notifications, dependent: :destroy
 

  def send_booking_email
    BookingRequest.booking_requested(self).deliver
  end



end
