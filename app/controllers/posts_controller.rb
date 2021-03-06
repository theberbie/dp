class PostsController < ApplicationController
   before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @post = Post.new

  end

  def index
    @posts = Post.all

  end

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

  


  def create
    current_user.posts.create(post_params)

    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    @booking = Booking.new
    
  end

  

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:pet_name,:pet_age, :pet_breed, :address_line, :zipcode, :description, :event_from, :event_to)
  end


end
