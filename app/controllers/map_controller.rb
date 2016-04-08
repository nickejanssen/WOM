class MapController < ApplicationController
	def index
    @users = User.all
    # @geojson = Array.new
    # user = User.last
    @geojson = { type: 'FeatureCollection',
    features: []}
    @users.each do |user|
      if user.longitude
        lon_r = Random.new
        lat_r = Random.new
        longitude = user.longitude + lon_r.rand(-0.0007..0.0007)
        latitude = user.latitude + lat_r.rand(-0.0007..0.0007)
        @geojson[:features] << {
          type: 'Feature',
          geometry: {
            type: 'Point',
            coordinates: [longitude, latitude]
          },
          properties: {
            title: user.name,
            description: user.location,
            :"marker-color" => "#00607d",
            :"marker-symbol" => "circle",
            :"marker-size" => "medium"
          }
        }
      end
    end
    
    respond_to do |format|
      format.html
      format.json { render json: @geojson }  # respond with the created JSON object
    end

  end
end
