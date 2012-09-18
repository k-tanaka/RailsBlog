# -*- coding:utf-8 -*-
class Post < ActiveRecord::Base
    attr_accessible :content, :name, :title

    validates :name,    :presence => { :message => '投稿者を入力してください' }
    validates :title,   :presence => { :message => 'タイトルを入力してください' }, :length => { :minimum => 5, :message => '5文字以上でお願いします' }

    has_many :comments
    has_and_belongs_to_many :tags

    default_scope :order => 'updated_at DESC'

    paginates_per 10
end
