class V1::BlogController < ApplicationController
  def index
    @blogs = Blog.all.order(created_at: :desc).limit(10)
  end

  def show
    @blog = Blog.find(params[:id])
  end
end
