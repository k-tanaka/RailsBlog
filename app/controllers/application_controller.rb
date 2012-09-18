class ApplicationController < ActionController::Base
    protect_from_forgery

    before_filter :_getRecentPosts
    before_filter :_getTags
    before_filter :_isAdmin

    private
    def _getRecentPosts
        @recent_posts = Post.find(:all, :limit => 5)
    end

    private
    def _getTags
        @rand_tags = Tag.find(:all, :order => 'RAND()')
    end

    private
    def _isAdmin
        @is_admin = false

        case params[:controller]
        when 'posts'
            @is_admin = true
        else
            @is_admin = false
        end
    end
end
