import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/providers/map_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> _controller = Completer();
    var size = MediaQuery.of(context).size;
    final mapProvider = Provider.of<MapProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: GoogleMap(
            initialCameraPosition: mapProvider.kInitialPosition,
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            onTap: (latLng) {},
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: mapProvider.markers != null
                ? mapProvider.markers!.map((e) => e).toSet()
                : {},
          ),
        ),
      ),
    );
  }
}
