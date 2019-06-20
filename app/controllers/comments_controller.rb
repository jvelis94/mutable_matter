class CommentsController < ApplicationController
    def index
        @comments = Comment.all
    end

    def new
        @comment = Comment.new
    end
    
    def create
        @comment = Comment.new(comment_params)
        @comment.user = current_user
        @comment.post = current_user.post
        respond_to do |format|
            if @comment.save
                format.html { redirect_to post_path, notice: 'Post was successfully created.' }
            else
                render action: 'new'
            end
        end
    end

    private

    def comment_params
        params.require('comment').permit(:description)
    end
end
