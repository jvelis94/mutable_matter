class RepliesController < ApplicationController

    def create
        @reply = Reply.new(reply_params)
        @reply.comment_id = params[:comment_id]
        @reply.author = "#{current_user.first_name} #{current_user.last_name}"
        @reply.save
        redirect_to post_path(@comment.id)
    end

    private

    def reply_params
        params.require('reply').permit(:description, :author)
    end
    
    
end
