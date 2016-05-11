class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def new
  	@posts = Post.new
  end

  def create
  	post = Post.create post_params do |p|
      p.user_id = @current_user.id
      p.save
  end
  if post.valid?
      flash[:success] = 'Your post has been created!'
      redirect_to root_path
    else
      messages = post.errors.map { |k, v| "#{k} #{v}" }
      flash[:danger] = messages.join(', ')
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find params[:id]
  end

  private

  def post_params
    params.require(:post).permit(:title, :link)
  end
end
