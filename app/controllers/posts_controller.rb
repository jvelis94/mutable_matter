class PostsController < ApplicationController
    before_action :find_id, only: [:show, :edit, :update, :destroy]

    def index
        @posts = Post.all
    end

    def show
    end
  
    def new
      @post = Post.new
    end
  
    def create
      @post = Post.new(post_params)
      @post.user = current_user
      respond_to do |format|
        if @post.save
            format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        else
            render action: 'new'
        end
      end
    end
  
    def edit
    end
  
    def update
      if @post.update(post_params)
        flash[:success] = "Post was successfully updated"
        # redirect_to
      else
        render 'edit'
      end
      redirect_to posts_path
    end
  
    def destroy
      @post.destroy
      redirect_to posts_path
    end

    private

    def post_params
        params.require('post').permit(:title, :date, :body)
    end

    def find_id
        @post = Post.find(params[:id])
    end
end
