class BookingsController < ApplicationController
before_action :authenticate_user! 

  
  
   def create
      @booking = Booking.new
      @post = Post.find(params[:post_id])
      if params['button_action'] == "accept"
      @booking.accept = 1
      @post.bookings.create(booking_params.merge(user: current_user))
      redirect_to post_path(@post)
      flash[:notice] = "You have accepted!"     
      else
        flash[:alert] = "You declined. No worries."
        redirect_to post_path(@post)
    end
  end

  def update
  end


  private 

def booking_params

 params.permit(:pet_name, :pet_age, :pet_breed, :address_line, :zipcode, :description, :event_from, :event_to, :accept)
end
end