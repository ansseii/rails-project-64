# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    @post_comment = current_user.comments.build(comment_params)

    respond_to do |format|
      if @post_comment.save
        format.html { redirect_to post_url(@post_comment.post_id), notice: t('.success') }
      else
        format.html { redirect_to post_url(@post_comment.post_id), notice: @post_comment.errors.full_messages.join(', ') }
      end
    end
  end

  def comment_params
    params.require(:post_comment)
          .permit(:content, :parent_id)
          .merge(post_id: params[:post_id])
  end
end
