class Api::PostsController <Api::ApiController
  skip_before_filter :verify_authenticity_token
  #before_filter :find_ads

  def index
    @posts = Post.all
    render json: @posts

  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: {
        status: 200,
        message: "Successfully created ad",
        post: @post
        }.to_json

      
    else
      render status:422, json: {

        
        errors: @post.error
      }.to_json
    end

  end

  def update
    @post = Post.find(params[:id])
    if @post.update(list_params)
      render json:{
        status: 200,
        message: "successfully updated ad",
        post: @post

      }.to_json

    else
      render status: 422, json:{
        errors: @post.errors,
        message: "Could not be updated"

      }.to_json
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render json:{
      status: 200,
      message: "successfully deleted ad",
      post: @post

    }.to_json

  end


  private

  def post_params
    params.require(:post).permit(:pet_name, :pet_breed, :address_line, :zipcode, :description)
  end

#   def find_ads
#     @ads = Ad.find(params[:ads_id])
#   end
end


end