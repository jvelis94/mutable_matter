class CommentsController < ApplicationController
    before_action :authenticate_user!, :find_commentable
    before_action :find_post_id
   
    def new
        @comment = Comment.new
    end
    
    def create
        @comment = @commentable.comments.new(comment_params)
        @comment.author = "#{current_user.first_name} #{current_user.last_name}"
        @comment.avatar = current_user.avatar
        if @comment.save
            redirect_to post_path(@post), notice: 'Your comment was successfully posted!'
        else
            redirect_to post_path(@post), notice: "Your comment wasn't posted!"
        end
    end
    

    private

    def comment_params
        params.require('comment').permit(:description, :author, :avatar)
    end

    def find_commentable
        @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
        @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
      end
    
      def find_post_id
        @post = Post.find(params[:post_id])
    end
end
