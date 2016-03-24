
$(document).on("ready", function() {
	L.mapbox.accessToken = ENV['MAP_BOX_TOKEN'];
	var map = L.mapbox.map('map', 'Your map layer', { zoomControl: false })
	.setView([39.739, -104.990], 12);

	map.featureLayer.on("ready", function(e) {
		getEvents(map);
	});
});

function getEvents(map) {
	var $loading_wheel = $("#spinning-wheel")
	$loading_wheel.show();
	$.ajax({
		dataType: 'text',
		url: '/events.json',
		success:function(events) {
			$loading_wheel.hide();
			var geojson = $.parseJSON(events);
			map.featureLayer.setGeoJSON({
				type: "FeatureCollection",
				features: geojson
			});
			addEventPopups(map);
		},
		error:function() {
			$loading_wheel.hide();
			alert("Could not load the events");
		}
	});
}

function addEventPopups(map) {
	map.featureLayer.on("layeradd", function(e) {
		var marker = e.layer;
		var properties = marker.feature.properties;
		var popupContent = '<div class="marker-popup">' + '<h3>' + properties.title + '</h3>' +
                       '<h4>' + properties.address + '</h4>' + '</div>';
                       marker.bindPopup(popupContent, {closeButton: false, minWidth: 300});
	});
}
