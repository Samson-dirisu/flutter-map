class LocationModel {

  List<Locations>? _locations;

  List<Locations>? get locations => _locations;

  LocationModel.fromJson(Map<String, dynamic> json) {
    if (json['locations'] != null) {
      _locations = [];
      json['locations'].forEach((data) {
        _locations!.add(Locations.fromModel(data));
      });
    }
  }
}

class Locations {

  String? _name;
  double? _latitude;
  double? _longitude;

  String? get name => _name;
  double? get latitude => _latitude;
  double? get longitude => _longitude;

  Locations.fromModel(Map<String, dynamic> json) {
    _name = json['name'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }
}
