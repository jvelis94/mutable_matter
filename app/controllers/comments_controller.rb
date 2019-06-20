class CommentsController < ApplicationController
    
    
    def create
        @comment = Comment.new(comment_params)
        @comment.post_id = params[:post_id]
        @comment.author = "#{current_user.first_name} #{current_user.last_name}"
        @comment.save
        redirect_to post_path(@comment.post)
      end

    private

    def comment_params
        params.require('comment').permit(:description, :author)
    end
end
