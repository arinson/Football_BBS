class LikesController < ApplicationController
  def index
    @likes_topics = current_user.like_topics
    @user = User.find_by(id: current_user.id)
  end

  def create
    @topic = Topic.find(params[:topic_id])
    like = Like.new
    like.user_id = current_user.id
    like.topic_id = params[:topic_id]
    like.save
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @like = Like.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    @like.destroy
  end
end
