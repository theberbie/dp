class BookingsController < PostsController
before_action :authenticate_user! 


  def time_offer
    @post = Post.find(params[:id])
    if @post.user != current_user
        flash[:notice] = "Request has been sent"
        BookingRequest.booking_requested(@post).deliver
        redirect_to post_path(@post)
      else
        flash[:alert] = "Cannot book yourself!"
        redirect_to post_path(@post)
    end
  end

  end

  def create
      @post = Post.find(params[:post_id])
      @post.bookings.create(booking_params.merge(user: current_user))

      if @post.user != current_user
        flash[:notice] = "Request has been sent"
        redirect_to post_path(@post)
      else
        flash[:alert] = "Cannot book yourself!"
        redirect_to post_path(@post)
    end
  end


  private 

def booking_params

 params.permit(:pet_name, :pet_age, :pet_breed, :address_line, :zipcode, :description, :event_from, :event_to)
end