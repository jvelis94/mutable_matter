class RepliesController < ApplicationController
    before_action :find_id, only: [:create]
    def create
        @reply = Reply.new(reply_params)
        @reply.comment_id = params[:comment_id]
        @reply.author = "#{current_user.first_name} #{current_user.last_name}"
        @reply.avatar = current_user.avatar
        @reply.save
        redirect_to post_path(@comment.post)
    end

    private

    def reply_params
        params.require('reply').permit(:description, :author)
    end
    
    def find_id
        @comment = Comment.find(params[:comment_id])
    end
    
end
