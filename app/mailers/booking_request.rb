class BookingRequest < ActionMailer::Base
  default from: "from@example.com"

  def booking_requested(booking)
    @post = booking
    @post_owner = @post.user

    mail(to: @post_owner, 
      subject: "A New Booking Has Been Requested")

  end
end
