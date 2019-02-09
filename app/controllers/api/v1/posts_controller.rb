class Api::V1::PostsController < ApplicationController
  def index
    posts = Post.order(created_at: :desc)
    render json: { status: 'SUCCESS', message: 'Loaded posts', data: posts }
  end

  def show
    post = Post.find(params[:id])
    render json: { status: 'SUCCESS', message: 'Loaded the post', data: post }
  end

  def create
    post = Post.new(post_params)
    if post.save
      render json: { status: 'SUCCESS', data: post }
    else
      render json: { status: 'ERROR', data: post.errors }
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    render json: { status: 'SUCCESS', message: 'Deleted the post', data: post }
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      render json: { status: 'SUCCESS', message: 'Updated the post', data: post }
    else
      render json: { status: 'SUCCESS', message: 'Not updated', data: post }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title)
  end
end
