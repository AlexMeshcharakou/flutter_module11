import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewContainer extends StatefulWidget {
  const MapViewContainer({Key? key}) : super(key: key);

  @override
  createState() => _MapViewContainerState();
}

class _MapViewContainerState extends State<MapViewContainer> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  LatLng currentMarker = const LatLng(53.684979, 23.830619);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _updateMarker(LatLng latlng) {
    setState(() {
      currentMarker = latlng;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        onTap: _updateMarker,
        markers: {
          Marker(
            draggable: true,
            onDragEnd: (latlng) => showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  title: Text("New position"),
                );
              },
            ),
            onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AlertDialog(
                    title: Text("position"),
                  );
                }),
            position: currentMarker,
            icon: BitmapDescriptor.defaultMarker,
            markerId: const MarkerId("1234"),
          )
        },
        initialCameraPosition: CameraPosition(
          target: currentMarker,
          zoom: 12.0,
        ),
      ),
    );
  }
}
