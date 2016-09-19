class BookingsController < ApplicationController
before_action :authenticate_user! 


  
  
   def create
      @booking = Booking.new
      @post = Post.find(params[:post_id])
      @post.bookings.create(booking_params.merge(user: current_user))
      if params['status'] == "Accepted"
      @booking.status = "Accepted"
      flash[:notice] = "You have accepted!" 
      create_notification @post
      redirect_to post_path(@post)    
      else
      @booking.status = "Declined"
      flash[:alert] = "You declined. No worries."
        redirect_to post_path(@post)
    end
  end

  def update
  end


  private 

def booking_params

 params.permit(:pet_name, :pet_age, :pet_breed, :address_line, :zipcode, :description, :event_from, :event_to, :status)
end

def create_notification(booking)
  
  Notification.create(user_id: booking.user.id,
                      notified_by_id: current_user.id,
                        
                        notice_type: 'comment')
end
end