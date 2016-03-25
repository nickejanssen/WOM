# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  title            :string(50)       default("")
#  comment          :text
#  commentable_id   :integer
#  commentable_type :string(255)
#  user_id          :integer
#  role             :string(255)      default("comments")
#  created_at       :datetime
#  updated_at       :datetime
#  comment_html     :text
#

# Copyright (c) 2015, @nickejanssen(Nicolas Janssen)
# WOM is an Open source Social network written in Ruby on Rails This file is licensed
# under GNU GPL v2 or later. See the LICENSE.

class Comment < ActiveRecord::Base
  include Shared::Callbacks
  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true, :counter_cache => true
  default_scope -> { order('created_at DESC') }

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user

  include PublicActivity::Model
  tracked only: [:create], owner: Proc.new{ |controller, model| model.user }

  validates_presence_of :comment
  validates_presence_of :commentable
  validates_presence_of :user

  auto_html_for :comment do
    html_escape
    image
    youtube(width: 400, height: 250, autoplay: true)
    link target: '_blank', rel: 'nofollow'
    simple_format
  end
end
