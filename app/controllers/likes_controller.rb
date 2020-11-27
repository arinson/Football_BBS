class LikesController < ApplicationController
  def index
    @likes_topics = current_user.like_topics.order(created_at: :desc)
    @user = User.find_by(id: current_user.id)
    @q = Topic.ransack(params[:q])
    @search_topics = @q.result.page(params[:page]).per(10)
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

  def search
    @user = User.find_by(id: current_user.id)
    @q = Topic.search(search_params)
    @search_topics = @q.result.page(params[:page]).per(10).order(created_at: :desc)
  end

  private

  def search_params
    params.require(:q).permit!
  end
end
