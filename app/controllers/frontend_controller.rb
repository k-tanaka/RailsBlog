##
# frontendコントローラ
#
# @package      blog
# @subpackage   FrontendController
# @author       k-tanaka@netcombb.co.jp
# @updater
# @copyright    2012.NetComBB Co.,Ltd
##
class FrontendController < ApplicationController
    ##{{{ index
    # 記事のリストを表示
    #
    # @access   public
    # @param    (none)
    # @return   void
    ##
    def index
        if params[:tag]
            tag = Tag.find(params[:tag])
            @posts = tag.posts.page(params[:page])
        else
            @posts = Post.page(params[:page])
        end

        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @posts }
        end
    end
    ##}}}
    ##{{{ show
    # 記事の詳細を表示
    #
    # @access   public
    # @param    (none)
    # @return   void
    ##
    def show
        @post = Post.find(params[:id])
        @comment = Comment.new

        respond_to do |format|
            format.html # show.html.erb
            format.json { render json: @post }
        end
    end
    ##}}}
    ##{{{ postComment
    def postComment
        @post = Post.find_by_id(params[:post_id])
        @comment = @post.comments.new(params[:comment])

        respond_to do |format|
            if @comment.save
                format.html { redirect_to :action => 'show', :id => @post.id, notice: 'Comment posted.' }
                format.json { render json: @comment, staus: :created, location: @comment }
                format.js
            else
                format.html { render action: 'show' }
                format.json { render json: @comment.errors, status: :unprocessable_entry }
            end
        end
    end
    ##}}}
end
