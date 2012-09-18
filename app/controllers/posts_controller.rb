class PostsController < ApplicationController
    layout 'admin'

    # GET /posts
    # GET /posts.json
    def index
        if params[:tag]
            tag = Tag.find(params[:tag])
            @posts = tag.posts
        else
            @posts = Post.all
        end

        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @posts }
        end
    end

    # GET /posts/1
    # GET /posts/1.json
    def show
        @post = Post.find(params[:id])

        respond_to do |format|
            format.html # show.html.erb
            format.json { render json: @post }
        end
    end

    # GET /posts/new
    # GET /posts/new.json
    def new
        @post = Post.new
        @tags = Tag.find(:all, :order => 'id ASC')

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @post }
        end
    end

    # GET /posts/1/edit
    def edit
        @post = Post.find(params[:id])
        @tags = Tag.find(:all, :order => 'id ASC')
    end

    # POST /posts
    # POST /posts.json
    def create
        @post = Post.new(params[:post])

        respond_to do |format|
            if @post.save
                format.html { redirect_to posts_url, :notice => '' }
                format.json { render json: @post, status: :created, location: @post }
            else
                format.html { render action: "new" }
                format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end

    # PUT /posts/1
    # PUT /posts/1.json
    def update
        @post = Post.find(params[:id])

        respond_to do |format|
            if @post.update_attributes(params[:post])
                format.html { redirect_to posts_url, :notice => '' }
                format.json { head :no_content }
            else
                format.html { render action: "edit" }
                format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /posts/1
    # DELETE /posts/1.json
    def destroy
        @post = Post.find(params[:id])
        @comments = @post.comments
        @comments.destroy_all
        @post.destroy

        respond_to do |format|
            format.html { redirect_to posts_url }
            format.json { head :no_content }
            format.js
        end
    end
end
