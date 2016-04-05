class MusicController < ApplicationController
  def index
  end

  def upload
  end

  def download
  	#s3 = Aws::S3::Resource::new(region: ENV['AWS_ALBUM_REGION'])
  	#url = s3.bucket(ENV['BUCKET_ALBUM']).object('WOM_SPEAKS.zip').presigned_url(:get, expires_in: 1*20.minutes)
  	#redirect_to url
  end

  def download2
  	#s3 = Aws::S3::Resource.new(region: ENV['AWS_MUSIC_REGION'])
  	#url = s3.bucket(ENV['BUCKET_MUSIC']).object('WOM_STEMS.zip').presigned_url(:get, expires_in: 1*20.minutes, response_content_disposition: 'attachment; filename=WOM_STEMS.zip')
  	#redirect_to url
  end


  def delete
  end
end
