# == Schema Information
#
# Table name: posts
#
#  id              :integer          not null, primary key
#  content         :text             not null
#  user_id         :integer
#  attachment      :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  cached_votes_up :integer          default(0)
#  comments_count  :integer          default(0)
#  content_html    :text
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
