class PostsController < ApplicationController
	before_action :set_post, only: [:edit, :update]

	def index
		@posts = Post.all
	end

	def show
		set_post
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.save
		redirect_to post_path(@post)
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
	  @post.update(post_params)
	  redirect_to post_path(@post)
	end

	private

    def post_params
        params.require(:post).permit(:title, :description)
    end

    def set_post
        @post = Post.find(params[:id])
    end

end