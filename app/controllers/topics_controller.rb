class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:like_users).page(params[:page]).per(10).order(created_at: :desc)
    @user = User.find_by(id: current_user.id)
    @q = Topic.ransack(params[:q])
    @search_topics = @q.result.page(params[:page]).per(10)
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

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to topics_path
    else
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path
  end

  def search
    @user = User.find_by(id: current_user.id)
    @q = Topic.search(search_params)
    @search_topics = @q.result.page(params[:page]).per(10)
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :image, :description)
  end

  def search_params
    params.require(:q).permit!
  end
end
