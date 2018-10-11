class Api::V1::TopicsController < ApplicationController
  def index
    topics = Topic.created(created_at::desc)
    render json: { status: 'SUCCESS', data: topics }, status: :ok
  end

  def create
    topic = Topic.new(topic_params)
    if topic.save
      render json: { status: 'SUCCESS', data: topic }, status: :ok
    else
      render json: { status: 'SUCCESS', data: topic.errors }, status: :error
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
