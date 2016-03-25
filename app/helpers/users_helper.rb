# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)      default(""), not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  about                  :string(255)
#  avatar                 :string(255)
#  cover                  :string(255)
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  sex                    :string(255)      default("male"), not null
#  location               :string(255)
#  dob                    :date
#  phone_number           :string(255)
#  posts_count            :integer          default(0), not null
#  slug                   :string(255)
#  latitude               :float
#  longitude              :float
#

# Copyright (c) 2015, @nickejanssen(Nicolas Janssen)
# WOM is an Open source Social network written in Ruby on Rails This file is licensed
# under GNU GPL v2 or later. See the LICENSE.

module UsersHelper
  def options_for_seasons
    [['Male', 'male'], ['Female', 'female']]
  end

  def age(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - (dob.to_date.change(:year => now.year) > now ? 1 : 0)
  end

  def is_current_user?(user)
    user == current_user
  end
end
