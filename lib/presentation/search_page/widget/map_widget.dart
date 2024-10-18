import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatelessWidget{
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Future<Position> _determinePosition() async {
    //   bool serviceEnabled;
    //   LocationPermission permission;
    //
    //   // Test if location services are enabled.
    //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
    //   if (!serviceEnabled) {
    //     // Location services are not enabled don't continue
    //     // accessing the position and request users of the
    //     // App to enable the location services.
    //     return Future.error('Location services are disabled.');
    //   }
    //
    //   permission = await Geolocator.checkPermission();
    //   if (permission == LocationPermission.denied) {
    //     permission = await Geolocator.requestPermission();
    //     if (permission == LocationPermission.denied) {
    //       // Permissions are denied, next time you could try
    //       // requesting permissions again (this is also where
    //       // Android's shouldShowRequestPermissionRationale
    //       // returned true. According to Android guidelines
    //       // your App should show an explanatory UI now.
    //       return Future.error('Location permissions are denied');
    //     }
    //   }
    //
    //   if (permission == LocationPermission.deniedForever) {
    //     // Permissions are denied forever, handle appropriately.
    //     return Future.error(
    //         'Location permissions are permanently denied, we cannot request permissions.');
    //   }
    //
    //   // When we reach here, permissions are granted and we can
    //   // continue accessing the position of the device.
    //   return await Geolocator.getCurrentPosition();
    // }

    return FlutterMap(
      options: MapOptions(
        backgroundColor: Colors.black,
        initialCenter: const LatLng(6.514193, 3.308678),
        initialZoom: 15.2,
        // onPointerUp: (event, point) => _onPointerUp(point),
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.flutter_map_example',
          tileBuilder: _darkModeTileBuilder,
        ),
        // _currentLocationLayer(),
      ],
    );
  }

  // Widget _currentLocationLayer() {
  //   return CurrentLocationLayer(
  //     followOnLocationUpdate: FollowOnLocationUpdate.always,
  //     turnOnHeadingUpdate: TurnOnHeadingUpdate.never,
  //     style: const LocationMarkerStyle(
  //       marker: DefaultLocationMarker(
  //         child: Icon(
  //           Icons.navigation,
  //           color: Colors.white,
  //         ),
  //       ),
  //       markerSize: Size(40, 40),
  //       markerDirection: MarkerDirection.heading,
  //     ),
  //   );
  // }

  Future<void> _onPointerUp(LatLng point) async {
    final List<geocoding.Placemark> placeMarks =
    await geocoding.placemarkFromCoordinates(
      point.latitude,
      point.longitude,
    );
    final place = placeMarks.firstOrNull;
    debugPrint('${place?.locality}, ${place?.thoroughfare} ${place?.subThoroughfare}');
  }

  Widget _darkModeTileBuilder(
      BuildContext context,
      Widget tileWidget,
      TileImage tile,
      ) {
    return ColorFiltered(
      colorFilter: const ColorFilter.matrix(<double>[
        -0.2126, -0.7152, -0.0722, 0, 255, // Red channel
        -0.2126, -0.7152, -0.0722, 0, 255, // Green channel
        -0.2126, -0.7152, -0.0722, 0, 255, // Blue channel
        0, 0, 0, 1, 0, // Alpha channel
      ]),
      child: tileWidget,
    );
  }

}