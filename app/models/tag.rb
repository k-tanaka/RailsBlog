# -*- coding:utf-8 -*-
class Tag < ActiveRecord::Base
    attr_accessible :name

    validates :name, :presence => { :message => 'せめて何か入力してください' }

    has_and_belongs_to_many :posts

    default_scope :order => 'updated_at DESC'
end
