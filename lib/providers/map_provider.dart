import 'package:flutter/material.dart';
import 'package:flutter_map/models/location_model.dart';
import 'package:flutter_map/services/location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProvider extends ChangeNotifier {
  MapProvider() {
    getLocationModel();
  }

  LocationModel? _locations;
  List<Marker>? _markers;
  final LocationService _locationService = LocationService();
  final CameraPosition _kInitialPosition =
      const CameraPosition(target: LatLng(25.1212, 55.1535), zoom: 11);

  LocationModel? get locations => _locations;
  List<Marker>? get markers => _markers;
  CameraPosition get kInitialPosition => _kInitialPosition;
  // Function to get location Model
  void getLocationModel() {
    _locations = _locationService.convertToObject();
    getMarkers();
    notifyListeners();
  }










  

  // Funtion to convert location model to Markers
  void getMarkers() {
    if (_locations?.locations != null) {
      _markers = [];
      for (Locations data in _locations!.locations!) {
        _markers!.add(
          Marker(
            markerId: MarkerId(data.name!),
            position: LatLng(data.latitude!, data.longitude!),
            infoWindow: InfoWindow(title: data.name),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueRed,
            ),
          ),
        );
      }
    }
  }
}
