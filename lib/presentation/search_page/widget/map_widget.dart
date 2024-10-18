import 'package:flutter/material.dart';
import 'package:flutter_engineer_translation_test/core/animation/animation_service.dart';
import 'package:flutter_engineer_translation_test/themes/colors.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:get_it/get_it.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends HookWidget {
  MapWidget({super.key});

  final List<LatLng> markers = [
    const LatLng(6.521778, 3.306678),
    const LatLng(6.51960, 3.307378),
    const LatLng(6.51860, 3.312378),
    const LatLng(6.51360, 3.312378),
    const LatLng(6.51250, 3.305178),
    const LatLng(6.50860, 3.310478),
  ];

  final animationService = GetIt.I<AnimationService>();

  @override
  Widget build(BuildContext context) {

    final animationController =
    useAnimationController(duration: const Duration(milliseconds: 1200));

    final zoomAnimation =
    animationService.createZoomAnimation(animationController);

    useEffect(() {
      Future.delayed(
        const Duration(milliseconds: 1500),
      ).whenComplete(() => animationController.forward());
      return null;
    }, []);

    return FlutterMap(
      options: MapOptions(
        backgroundColor: Colors.black,
        initialCenter: const LatLng(6.514193, 3.308678),
        initialZoom: 15.2,
        onPointerUp: (event, point) => _onPointerUp(context, point),
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.flutter_map_example',
          tileBuilder: _darkModeTileBuilder,
        ),
        ScaleTransition(
          scale: zoomAnimation,
          child: MarkerLayer(
            markers: List.generate(markers.length, (int index){
              return _buildMarker(markers[index]);
            }),
          ),
        ),
        // _currentLocationLayer(),
      ],
    );
  }

  Future<void> _onPointerUp(BuildContext context, LatLng point) async {
    try {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
      final List<geocoding.Placemark> placeMarks =
          await geocoding.placemarkFromCoordinates(
        point.latitude,
        point.longitude,
      );
      final place = placeMarks.firstOrNull;
      debugPrint(
          '${place?.locality}, ${place?.thoroughfare} ${place?.subThoroughfare}');
    } catch (e) {
      debugPrint('$e');
    }
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

  _buildMarker(LatLng latLng) {
    return Marker(
      width: 50,
      height: 50,
      point: latLng,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
            ),
          ],
        ),
        padding: const EdgeInsets.all(5),
        child: const Center(
          child: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
