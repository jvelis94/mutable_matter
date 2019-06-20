class RepliesController < ApplicationController
    def new
        @reply = Reply.new
    end

    def create
        @reply = Reply.new(reply_params)
        @reply.author = "#{current_user.first_name} #{current_user.last_name}"
        @reply.save
        redirect_to post_path(@comment.post)
    end

    private

    def reply_params
        params.require('reply').permit(:description, :author)
    end
    
    
end
