# == Schema Information
#
# Table name: follows
#
#  id              :integer          not null, primary key
#  followable_id   :integer          not null
#  followable_type :string(255)      not null
#  follower_id     :integer          not null
#  follower_type   :string(255)      not null
#  blocked         :boolean          default(FALSE), not null
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class FollowsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
