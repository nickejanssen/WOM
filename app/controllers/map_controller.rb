class MapController < ApplicationController
	def index
    @users = User.all
    # @geojson = Array.new
    # user = User.last
    @geojson = { type: 'FeatureCollection',
    features: []}

    @users.each do |user|
      @geojson[:features] << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [user.longitude, user.latitude]
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
    
    respond_to do |format|
      format.html
      format.json { render json: @geojson }  # respond with the created JSON object
    end

  end
end
