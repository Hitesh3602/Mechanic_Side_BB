import 'package:flutter/material.dart';
import 'package:mechanic_side/mech_login.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              height: 200, // Set desired height
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/logo.jpg'), // Use AssetImage for assets
                  fit: BoxFit.contain, // Adjust the image fit as needed
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add navigation logic for user login
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(75, 57, 239, 0.911),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      'Login as a User',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MechLogin()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(75, 57, 239, 0.911),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      'Login as a Mechanic',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
