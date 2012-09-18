class BackendController < ApplicationController
    layout 'admin'

    def index
        @posts = Post.limit(5)
        @tags  = Tag.limit(7)
    end
end
