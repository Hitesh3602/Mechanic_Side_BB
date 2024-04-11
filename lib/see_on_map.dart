import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SeeOnMap extends StatefulWidget {
  const SeeOnMap({Key? key}) : super(key: key);

  @override
  _SeeOnMapState createState() => _SeeOnMapState();
}

class _SeeOnMapState extends State<SeeOnMap> {
  late GoogleMapController mapController;
  final Set<Marker> _markers = {};
  bool _mechanicOnline = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('See Location on Map'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: LatLng(20.5937, 78.9629), // India coordinates
              zoom: 4.0,
            ),
            markers: _markers,
          ),
          if (!_mechanicOnline)
            Container(
              color: Colors.black
                  .withOpacity(0.6), // Dark background color with opacity
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Text(
                  'Offline',
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
              ),
            ),
          Positioned(
            top: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _mechanicOnline = !_mechanicOnline;
                  if (!_mechanicOnline) {
                    _removeMarkers();
                    _fetchAndDisplayLocations();
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _mechanicOnline ? Colors.green : Colors.red,
              ),
              child: Text(
                _mechanicOnline ? 'Online' : 'Offline',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
    if (!_mechanicOnline) {
      _fetchAndDisplayLocations();
    }
  }

  void _fetchAndDisplayLocations() {
    FirebaseFirestore.instance
        .collection('locations')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        double lat = doc['latitude'].toDouble();
        double lng = doc['longitude'].toDouble();
        print('Fetched location: $lat, $lng'); // Debug print
        _addMarker(lat, lng);
      });
    });
  }

  void _addMarker(double lat, double lng) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('$lat-$lng'),
          position: LatLng(lat, lng),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueRed), // Red marker
        ),
      );
    });
  }

  void _removeMarkers() {
    setState(() {
      _markers.clear();
    });
  }
}
