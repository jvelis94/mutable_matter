class PagesController < ApplicationController
    # skip_before_action :authenticate_user!, only: :home
    before_action :find_id, only: [:show]


  def home
    @posts = Post.all
  end

  def show
  end
  
  def components
  end

  private

    def find_id
        @post = Post.find(params[:id])
    end
end
