class MapController < ApplicationController
	def index
    @users = User.all
    @geojson = Array.new

    @users.each do |user|
      @geojson << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [user.longitude, user.latitude]
        },
        properties: {
          name: user.name,
          address: user.street,
          :'marker-color' => '#00607d',
          :'marker-symbol' => 'circle',
          :'marker-size' => 'medium'
        }
      }
    end
end
end
