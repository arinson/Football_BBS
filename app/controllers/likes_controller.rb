class LikesController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    like = Like.new(user_id: current_user.id, topic_id: @topic.id)
    like.save
    @likes_count = Like.where(topic_id: @topic.id).count
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    like = Like.find_by(topic_id: params[:topic_id], user_id: current_user.id)
    like.destroy
    @likes_count = Like.where(topic_id: @topic.id).count
  end
end
