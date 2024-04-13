// import 'package:flutter/material.dart';

// class AcceptScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Service Details'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildSectionTitle('User Information'),
//             _buildInfoRow('Name', 'John Doe'),
//             _buildInfoRow('Contact', '+1 123-456-7890'),
//             _buildInfoRow('Email', 'john.doe@example.com'),
//             SizedBox(height: 20.0),
//             _buildSectionTitle('Vehicle Information'),
//             _buildInfoRow('Make', 'Toyota'),
//             _buildInfoRow('Model', 'Camry'),
//             _buildInfoRow('License Plate', 'ABC1234'),
//             SizedBox(height: 20.0),
//             _buildSectionTitle('Problem Description'),
//             Text(
//               'Vehicle won\'t start. Suspected battery issue.',
//               style: TextStyle(fontSize: 16.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionTitle(String title) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 10.0),
//       child: Text(
//         title,
//         style: TextStyle(
//           fontSize: 18.0,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoRow(String label, String value) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 5.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 16.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Text(
//             value,
//             style: TextStyle(fontSize: 16.0),
//           ),
//         ],
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: AcceptScreen(),
//   ));
// }
