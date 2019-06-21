class CommentsController < ApplicationController
    before_action :authenticate_user!, :find_commentable
   
    def new
        @comment = Comment.new
    end
    
    def create
        @comment = @commentable.comments.new comment_params
        @comment.author = "#{current_user.first_name} #{current_user.last_name}"
        @comment.avatar = current_user.avatar
        if @comment.save
            redirect_to posts_path, notice: 'Your comment was successfully posted!'
        else
            redirect_to posts_path, notice: "Your comment wasn't posted!"
        end
    end
    

    private

    def comment_params
        params.require('comment').permit(:description, :author)
    end

    def find_commentable
        @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
        @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
      end
end
