// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(BirthdayCardApp());
// }
//
// class BirthdayCardApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BirthdayCardScreen(),
//     );
//   }
// }
//
// class BirthdayCardScreen extends StatelessWidget {
//   final String name = "John Doe";
//   final String venue = "Party Venue";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Birthday Card'),
//       ),
//       body: Center(
//         child: GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => EditInformationScreen(
//                   name: name,
//                   venue: venue,
//                 ),
//               ),
//             );
//           },
//           child: Stack(
//             children: [
//               Image.network(
//                 "https://developmentalphawizz.com/invitation_design/uploads/64b243475dd60.jpg", // Replace with your image URL
//                 fit: BoxFit.cover,
//                 width: 300,
//                 height: 200,
//               ),
//               Positioned(
//                 top: 50,
//                 left: 20,
//                 child: Text(
//                   name,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 100,
//                 left: 20,
//                 child: Text(
//                   venue,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class EditInformationScreen extends StatefulWidget {
//   final String name;
//   final String venue;
//
//   EditInformationScreen({required this.name, required this.venue});
//
//   @override
//   _EditInformationScreenState createState() => _EditInformationScreenState();
// }
//
// class _EditInformationScreenState extends State<EditInformationScreen> {
//   late TextEditingController _nameController;
//   late TextEditingController _venueController;
//
//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController(text: widget.name);
//     _venueController = TextEditingController(text: widget.venue);
//   }
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     _venueController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Information'),
//       ),
//       body: Center(
//         child: Stack(
//           children: [
//             Image.network(
//               "https://developmentalphawizz.com/invitation_design/uploads/64b243475dd60.jpg", // Replace with your image URL
//               fit: BoxFit.cover,
//               width: 300,
//               height: 200,
//             ),
//             Positioned(
//               top: 50,
//               left: 20,
//               child: TextFormField(
//                 controller: _nameController,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 100,
//               left: 20,
//               child: TextFormField(
//                 controller: _venueController,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           String editedName = _nameController.text;
//           String editedVenue = _venueController.text;
//           // Navigator.pop(
//           //   context,
//           //   {
//           //     'name': editedName,
//           //     'venue': editedVenue,
//           //   },
//           // );
//         },
//         child: Icon(Icons.done),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BirthdayCardScreen(),
    );
  }
}

class BirthdayCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birthday Card'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replace 'your_image_url' with the actual image URL or use AssetImage
            Image.network('your_image_url'),
            SizedBox(height: 20),
            Text('Name: John Doe'),
            Text('Date: 25th July 2023'),
            Text('Time: 6:00 PM'),
            Text('Venue: Some Venue'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditScreen()),
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}



class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _venueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Text'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replace 'your_image_url' with the actual image URL or use AssetImage
            Image.network('your_image_url'),
            SizedBox(height: 20),
            buildEditableText("Name", _nameController),
            buildEditableText("Date", _dateController),
            buildEditableText("Time", _timeController),
            buildEditableText("Venue", _venueController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Perform any action here to save the edited text.
                // For example, you can update the original card data with the edited text.
                Navigator.pop(context); // Go back to the previous screen.
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEditableText(String labelText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
