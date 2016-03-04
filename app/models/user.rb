# Copyright (c) 2015, @nickejanssen(Nicolas Janssen)
# WOM is an Open source Social network written in Ruby on Rails This file is licensed
# under GNU GPL v2 or later. See the LICENSE.

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable,
     :omniauthable, :omniauth_providers => [:twitter]
  acts_as_voter
  acts_as_follower
  acts_as_followable

  has_many :posts
  has_many :comments
  has_many :events

  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover, AvatarUploader

  validates_presence_of :name

  self.per_page = 10

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]



  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.location = auth.info.location
        user.password = Devise.friendly_token[0,20]
      end
  end
end
