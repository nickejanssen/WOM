# == Schema Information
#
# Table name: events
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  when            :datetime
#  user_id         :integer
#  created_at      :datetime
#  updated_at      :datetime
#  cached_votes_up :integer          default(0)
#  comments_count  :integer          default(0)
#

module EventsHelper
end
