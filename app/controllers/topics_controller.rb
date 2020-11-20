class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:like_users)
    @user = User.find_by(params[:id])
  end

  def show
    @topic = Topic.find_by(id: params[:id])
    @user = @topic.user
    @comments = @topic.comments
    @comment = Comment.new
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path
    else
      render :new
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :image, :description)
  end
end
