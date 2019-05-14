# frozen_string_literal: true
class PostsController < ApplicationController
  include PostsHelper

  def index
    @posts = Post.all
  end

  def new
    if signed_in?
      @post = current_user.posts.new
    else
      flash[:error] = 'Please, sign in to create post'
      redirect_to new_session_path
    end
  end

  def create
    @post = current_user.posts.create post_params
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
