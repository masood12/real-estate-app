import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:assesment_task/core/constants/app_colors.dart';
import 'package:assesment_task/core/constants/strings.dart';
import 'package:assesment_task/core/widgets/circular_button.dart';
import 'package:assesment_task/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _controller;
  Set<Marker> _markers = {};
  final LatLng defaultLocation = const LatLng(24.8121185, 67.0125215);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: GoogleMap(
                initialCameraPosition: CameraPosition(target: defaultLocation, zoom: 14.0),
                myLocationButtonEnabled: false,
                myLocationEnabled: false,
                onMapCreated: _onMapCreated,
                markers: _markers,
                zoomControlsEnabled: false,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, kToolbarHeight, 24, 0),
                child: Row(
                  children: [
                    const Expanded(
                      child: CustomTextFormField(
                        hintText: Strings.searchLocation,
                        prefixIcon: Icon(
                          Icons.search,
                          size: 22,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: CircularIconButton(
                        onPressed: () {},
                        backgroundColor: Colors.white,
                        iconData: Icons.filter_list,
                        size: 26,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: kToolbarHeight * 2, left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircularIconButton(
                      onPressed: () {},
                      backgroundColor: Colors.grey.withOpacity(0.6),
                      iconData: Icons.stacked_line_chart,
                      size: 24,
                      iconColor: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircularIconButton(
                            onPressed: () {},
                            backgroundColor: Colors.grey.withOpacity(0.6),
                            iconData: Icons.directions,
                            size: 24,
                            iconColor: Colors.white,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.horizontal_split_sharp,
                                    color: AppColors.whiteColor,
                                    size: 24,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    Strings.listOfVariation,
                                    style: textTheme.titleMedium?.copyWith(
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    _markers.clear();
    final customMarker = await createMarkerBytesViaCanvas(120, 60, "8,5 mn ₽");
    final clusterIcon = BitmapDescriptor.bytes(customMarker);
    final markers = {
      Marker(
        markerId: const MarkerId('ss'),
        icon: clusterIcon,
        position: defaultLocation,
      ),
      Marker(
        markerId: const MarkerId('dole'),
        icon: clusterIcon,
        position: const LatLng(24.8207238, 66.9916144),
      ),
      Marker(
        markerId: const MarkerId('fare'),
        icon: clusterIcon,
        position: const LatLng(24.8347984, 67.0149497),
      ),
    };

    setState(() {
      _markers = markers;
    });
    _controller.animateCamera(CameraUpdate.newLatLngZoom(defaultLocation, 13.0));
  }

  /// Function to create custom marker on map using canvas
  Future<Uint8List> createMarkerBytesViaCanvas(
    int width,
    int height,
    String markerLabel,
  ) async {
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = AppColors.primaryColor;

    const Radius radius = Radius.circular(22);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0, 0.0, width.toDouble(), height.toDouble()),
          topLeft: radius,
          topRight: radius,
          bottomLeft: const Radius.circular(0),
          bottomRight: radius,
        ),
        paint);
    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = TextSpan(
      text: markerLabel,
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: AppColors.whiteColor,
      ),
    );

    painter.layout();
    painter.paint(
      canvas,
      Offset((width - painter.width) / 2, (height - painter.height) / 2),
    );

    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ImageByteFormat.png);
    return data!.buffer.asUint8List();
  }
}
