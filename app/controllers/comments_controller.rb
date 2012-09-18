class CommentsController < ApplicationController
    layout 'admin'

    def index
        @post = Post.find(params[:post_id])
        @comments = @post.comments

        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @posts }
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        respond_to do |format|
            format.html { redirect_to comments_url }
            format.json { head :no_content }
            format.js
        end
    end
end
