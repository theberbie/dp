class BookingRequest < ActionMailer::Base
  default from: "from@example.com"

  def booking_requested(user)
    @user = user

    mail(to: @user, 
      subject: "A New Booking Has Been Requested")

  end
end
