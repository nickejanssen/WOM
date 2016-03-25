# == Schema Information
#
# Table name: musics
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Music < ActiveRecord::Base
end
