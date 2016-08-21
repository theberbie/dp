class StaticPagesController < ApplicationController

  def index
  end

  def new
    @post = Post.new
  end

  def create
    current_user.posts.create(search_params)
  end

end
