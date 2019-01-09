class Api::V1::TopicsController < ApplicationController
  def index
    topics = Topic.order(created_at: :desc)
    render json: { status: 'SUCCESS', message: 'Loaded topics', data: topics }
  end

  def show
    topic = Topic.find(params[:id])
    render json: { status: 'SUCCESS', message: 'Loaded the topic', data: topic }
  end

  def create
    topic = Topic.new(topic_params)
    if topic.save
      render json: { status: 'SUCCESS', data: topic }
    else
      render json: { status: 'ERROR', data: topic.errors }
    end
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    render json: { status: 'SUCCESS', message: 'Deleted the topic', data: topic }
  end

  def update
    topic = Topic.find(params[:id])
    if topic.update(topic_params)
      render json: { status: 'SUCCESS', message: 'Updated the topic', data: topic }
    else
      render json: { status: 'SUCCESS', message: 'Not updated', data: topic }
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
