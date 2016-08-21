class BookingsController < ApplicationController

def create
  current_user.bookings.create(post: current_post)
  redirect_to post_path(current_post)
end


private

def current_post
  @current_post ||= Post.find(params[:post_id])
end

end
