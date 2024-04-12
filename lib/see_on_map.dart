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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('See Location on Map'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(20.5937, 78.9629), // India coordinates
          zoom: 4.0,
        ),
        markers: _markers,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
    _fetchAndDisplayLocations();
  }

  void _fetchAndDisplayLocations() {
    FirebaseFirestore.instance
        .collection('locations')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        double lat = doc['latitude'].toDouble();
        double lng = doc['longitude'].toDouble();
        _addMarker(lat, lng);
      });
    }).catchError((error) {
      print('Error fetching location: $error');
    });
  }

  void _addMarker(double lat, double lng) {
    MarkerId markerId = MarkerId(lat.toString() + lng.toString());
    Marker marker = Marker(
      markerId: markerId,
      position: LatLng(lat, lng),
      onTap: () {
        _showLocationPopup(lat, lng);
      },
    );
    setState(() {
      _markers.add(marker);
    });
  }

  void _showLocationPopup(double lat, double lng) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Location Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Latitude: $lat'),
              Text('Longitude: $lng'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
