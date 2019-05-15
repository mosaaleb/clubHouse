# frozen_string_literal: true
class PostsController < ApplicationController
  include PostsHelper
  before_action :authenticate, :only[:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.new
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
