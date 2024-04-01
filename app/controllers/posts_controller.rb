class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @posts = Post.all.order(created_at: :desc)
    if params[:search] == nil
      @posts= Post.all.order(created_at: :desc)
    elsif params[:search] == ''
      @posts= Post.all.order(created_at: :desc)
    else
      #部分検索
      @posts = Post.where("about LIKE ? ",'%' + params[:search] + '%').or(Post.where("title LIKE ? ",'%' + params[:search] + '%')).or(Post.where("name LIKE ? ",'%' + params[:search] + '%')).order(created_at: :desc)
    end
  end

  def new
    @posts = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "index"
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def top
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to action: :index
  end

  private
  def post_params
    params.require(:post).permit(:name, :title, :about, :image, :genre, :seat, :volume, :clean, :shop, :lat, :lng)
  end
end
