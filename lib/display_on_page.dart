// database se location lekar TEXT ke form mai show kar rha hai yeh code

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mechanic_side/see_on_map.dart';

class DisplayOnPage extends StatefulWidget {
  const DisplayOnPage({Key? key}) : super(key: key);

  @override
  _DisplayOnPageState createState() => _DisplayOnPageState();
}

class _DisplayOnPageState extends State<DisplayOnPage> {
  String _locationText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _getLocationFromDB,
              child: Text('Get Location from DB'),
            ),
            SizedBox(height: 20),
            Text(
              _locationText,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SeeOnMap()),
                );
              },
              child: Text('See on Map'),
            ),
          ],
        ),
      ),
    );
  }

  void _getLocationFromDB() {
    FirebaseFirestore.instance
        .collection('locations')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          double lat = doc['latitude'];
          double lng = doc['longitude'];
          _locationText = 'Latitude: $lat, Longitude: $lng';
        });
      });
    }).catchError((error) {
      print('Error fetching location: $error');
      setState(() {
        _locationText = 'Error fetching location: $error';
      });
    });
  }
}
