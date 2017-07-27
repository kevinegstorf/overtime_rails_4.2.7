class Api::V1::PostsController < Api::BaseController
  def index
    posts = Post.all
    render json: posts
  end
end
