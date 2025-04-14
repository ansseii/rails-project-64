# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.includes(:category, :creator).find(params[:id])
    @post_comment = @post.comments.build
    @post_comments = PostComment.includes(:user)
                                .where(post_id: params[:id])
                                .order(created_at: :desc).arrange
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: t('.success') }
      else
        format.html { render :new, status: :unprocessable_content }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
