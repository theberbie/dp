class PostsController < ApplicationController
   before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
    current_user.posts.create(post_params)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    @review = Review.new
  end

  def edit
    @Post = Post.find(params[:id])
  end

  def update
    @Post = Posts.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to root_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:pet_name, :pet_age, :pet_breed, :address_line, :zipcode, :description)
  end


end
