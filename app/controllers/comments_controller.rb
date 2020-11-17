class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @comments = @topic.comments
    @comment = current_user.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @comments = @topic.comments
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :topic_id)
  end
end
