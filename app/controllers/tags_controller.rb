# -*- coding:utf-8 -*-
class TagsController < ApplicationController
    layout 'admin'

    def index
        @tags = Tag.all()
        @tag = Tag.new
    end

    def create
        @tag = Tag.new(params[:tag])

        respond_to do |format|
            if @tag.save
                format.json { render json: @tag, status: :created, location: @tag }
                format.js
            else
                format.html { render action: 'new' }
                format.json { render json: @tag.errors, status: :unprocessable_entry }
            end
        end
    end

    def edit
        @tag = Tag.find(params[:id])

        respond_to do |format|
            format.js
        end
    end

    def update
        @tag = Tag.find(params[:id])

        respond_to do |format|
            if @tag.update_attributes(params[:tag])
                format.html { redirect_to tags_url }
                format.json { render json: @tag, status: :created, location: @tag }
            else
                format.html { render action: 'edit' }
                format.json { render json: @tag.errors, status: :unprocessable_entry }
            end
        end
    end

    def destroy
        @tag = Tag.find(params[:id])
        @tag.destroy

        respond_to do |format|
            format.json { head :no_content }
            format.js
        end
    end
end
