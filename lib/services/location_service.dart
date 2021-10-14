import 'package:flutter_map/models/location_model.dart';

class LocationService {

  // List of locations and their details
  final Map<String, dynamic> _locationData = {
    "locations": [
      {
        "name": "Rixos The Palm Dubai",
        "latitude": 25.1212,
        "longitude": 55.1535
      },
      {"name": "Shangri-La Hotel", "latitude": 25.2084, "longitude": 55.2719},
      {"name": "Grand Hyatt", "latitude": 25.2285, "longitude": 55.3273}
    ]
  };

  // Function to convert json to dart object
  LocationModel convertToObject() {
    return LocationModel.fromJson(_locationData);
  }
}
