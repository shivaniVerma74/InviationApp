// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(WeddingCardApp());
// }
//
// class WeddingCardApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Wedding Card',
//       home: WeddingCardScreen(),
//     );
//   }
// }
//
// class WeddingCardScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Wedding Invitation'),
//       ),
//       body: Column(
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height/3,
//             child: Expanded(
//               flex: 2,
//               child: CardDetails(
//                 backgroundColor: Colors.pinkAccent,
//                 title: 'Bride\'s Details',
//                 content: 'Name: Emily\nAge: 28\nOccupation: Designer',
//               ),
//             ),
//           ),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height/3,
//             child: Expanded(
//               flex: 1,
//               child: CardDetails(
//                 backgroundColor: Colors.blueAccent,
//                 title: 'Groom\'s Details',
//                 content: 'Name: James\nAge: 30\nOccupation: Engineer',
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CardDetails extends StatelessWidget {
//   final Color backgroundColor;
//   final String title;
//   final String content;
//
//   CardDetails({
//     required this.backgroundColor,
//     required this.title,
//     required this.content,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: backgroundColor,
//       margin: EdgeInsets.all(16.0),
//       elevation: 8.0,
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               content,
//               style: TextStyle(fontSize: 16, color: Colors.white),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(WeddingCardApp());
// }
//
// class WeddingCardApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Wedding Card',
//       home: WeddingCardScreen(),
//     );
//   }
// }
//
// class WeddingCardScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Wedding Invitation'),
//       ),
//       body: Center(
//         child: WeddingCard(),
//       ),
//     );
//   }
// }
//
// class WeddingCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(16.0),
//       elevation: 8.0,
//       child: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/background_image.jpg'), // Replace with your image path
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Text(
//                 'Wedding Invitation',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'Mr. John Doe & Miss Jane Smith',
//                 style: TextStyle(fontSize: 18, color: Colors.white),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'Request the pleasure of your company at their wedding!',
//                 style: TextStyle(fontSize: 16, color: Colors.white),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'Date: August 30, 2023',
//                 style: TextStyle(fontSize: 16, color: Colors.white),
//               ),
//               Text(
//                 'Time: 3:00 PM',
//                 style: TextStyle(fontSize: 16, color: Colors.white),
//               ),
//               Text(
//                 'Venue: Grand Hotel Ballroom',
//                 style: TextStyle(fontSize: 16, color: Colors.white),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

