// // import "package:flutter/material.dart";
// // import 'package:flutter/rendering.dart';
// // import 'package:flutter_application_1/second.dart';
// // import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';
// //
// //
// // class _TextOverImageState extends State<TextOverImage> {
// //
// //   List<Widget> list = [
// //     DraggableWidget(
// //         draggableWidget:
// //         Container(
// //           height: 50,
// //           width: 100,
// //           child:Text('SDG'),)),
// //     DraggableWidget(
// //         draggableWidget:
// //         Container(
// //           height: 50,
// //           width: 100,
// //           child: Text('vishal'),)),
// //
// //     DraggableWidget(
// //         draggableWidget:
// //         Container(
// //           height: 50,
// //           width: 100,
// //           child: Text('Rahul',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),)),
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         body: Column(
// //           children: [
// //             Center(
// //               child: Container(
// //                 height: 400,
// //                 width: 400,
// //                 color: Color.fromARGB(255, 225, 231, 236),
// //                 child: Stack(
// //                   children: list,
// //                 ),
// //               ),
// //             ),
// //             // ElevatedButton(onPressed: (){
// //             //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SecondScreen()));
// //             //
// //             // },
// //             //     child: Text('Send'))
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// //
// //
// // class DraggableWidget extends StatefulWidget {
// //   final Widget draggableWidget;
// //   DraggableWidget({Key? key, required this.draggableWidget}) : super(key: key); // changed
// //
// //   @override
// //   _DraggableWidgetState createState() => _DraggableWidgetState();
// // }
// //
// // class _DraggableWidgetState extends State<DraggableWidget> {
// //   double scale = 0.0;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
// //
// //     return Center(
// //       child: MatrixGestureDetector(
// //         onMatrixUpdate: (m, tm, sm, rm) {
// //           notifier.value = m;
// //         },
// //         child: AnimatedBuilder(
// //           animation: notifier,
// //           builder: (ctx, child) {
// //             return Transform(
// //               transform: notifier.value,
// //               child: Center(
// //                 child: Stack(
// //                   children: <Widget>[
// //                     Transform.scale(
// //                       scale:
// //                       1,
// //                       origin: Offset(0.0, 0.0),
// //                       child: widget.draggableWidget,
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
//
//
// import 'package:flutter/material.dart';
//
// // A useful extention for getting absolute coordinates of a widget
// // (found somewhere in SO)
// extension GlobalKeyExtension on GlobalKey {
//   Rect? get globalPaintBounds {
//     final renderObject = currentContext?.findRenderObject();
//     var translation = renderObject?.getTransformTo(null).getTranslation();
//     if (translation != null && renderObject?.paintBounds != null) {
//       return renderObject!.paintBounds
//           .shift(Offset(translation.x, translation.y));
//     } else {
//       return null;
//     }
//   }
// }
//
// class DragScreen extends StatefulWidget {
//   const DragScreen({Key? key}) : super(key: key);
//
//   @override
//   State<DragScreen> createState() => _DragScreenState();
// }
//
// class _DragScreenState extends State<DragScreen> {
//
//   var _x = 0.0;
//   var _y = 0.0;
//   final GlobalKey stackKey = GlobalKey();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.all(70.0),
//           child: Stack(
//           key: stackKey,
//           fit: StackFit.expand,
//           children: [
//             Container(color: Colors.blue),
//             Positioned(
//               left: _x,
//               top: _y,
//               child: Draggable(
//                 child: Text('Move me', style: TextStyle(color: Colors.white),),
//                 feedback: Text('Move me', style: TextStyle(color: Colors.red)),
//                 childWhenDragging: Container(),
//                 onDragEnd: (dragDetails) {
//                   setState(() {
//                     final parentPos = stackKey.globalPaintBounds;
//                     if (parentPos == null) return;
//                     _x = dragDetails.offset.dx - parentPos.left;
//                     _y = dragDetails.offset.dy - parentPos.top;
//                   });
//                 },
//               ),
//             ),
//           ],
//           ),
//         ),
//     );
//   }
//
//   Widget dragArea() =>
//       Stack(
//     key: stackKey,
//     fit: StackFit.expand,
//     children: [
//       Container(color: Colors.blue),
//       Positioned(
//         left: _x,
//         top: _y,
//         child: Draggable(
//           child: Text('Move me'),
//           feedback: Text('Move me'),
//           childWhenDragging: Container(),
//           onDragEnd: (dragDetails) {
//             setState(() {
//               final parentPos = stackKey.globalPaintBounds;
//               if (parentPos == null) return;
//               _x = dragDetails.offset.dx - parentPos.left;
//               _y = dragDetails.offset.dy - parentPos.top;
//             });
//           },
//         ),
//       ),
//     ],
//   );
//
// }


// import 'package:flutter/material.dart';
//
// extension GlobalKeyExtension on GlobalKey {
//   Rect? get globalPaintBounds {
//     final renderObject = currentContext?.findRenderObject();
//     var translation = renderObject?.getTransformTo(null).getTranslation();
//     if (translation != null && renderObject?.paintBounds != null) {
//       return renderObject!.paintBounds
//           .shift(Offset(translation.x, translation.y));
//     } else {
//       return null;
//     }
//   }
// }
//
// class MultipleDragScreen extends StatefulWidget {
//   const MultipleDragScreen({Key? key}) : super(key: key);
//
//   @override
//   _MultipleDragScreenState createState() => _MultipleDragScreenState();
// }
//
// class _MultipleDragScreenState extends State<MultipleDragScreen> {
//
//   List<DraggableText> draggableTexts = [
//     DraggableText(text: 'Text 1', color: Colors.red,x: 0,y: 0),
//     DraggableText(text: 'Text 2', color: Colors.green,x: 5,y: 4),
//     DraggableText(text: 'Text 3', color: Colors.blue,x: 8,y: 10),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(70.0),
//         child: Stack(
//           fit: StackFit.expand,
//           children: [
//             Container(color: Colors.black),
//             for (var draggableText in draggableTexts)
//               Positioned(
//                 left: draggableText.x,
//                 top: draggableText.y,
//                 child: Draggable(
//                   child: Text(
//                     draggableText.text,
//                     style: TextStyle(color: Colors.orange),
//                   ),
//                   feedback: Text(
//                     draggableText.text,
//                     style: TextStyle(color: draggableText.color),
//                   ),
//                   childWhenDragging: Container(),
//                   onDragEnd: (dragDetails) {
//                     setState(() {
//                       final parentPos = context.findRenderObject()?.paintBounds;
//                       if (parentPos == null) return;
//                       draggableText.x = dragDetails.offset.dx - parentPos.left;
//                       draggableText.y = dragDetails.offset.dy - parentPos.top;
//                     });
//                   },
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class DraggableText {
//   String text;
//   Color color;
//   double x;
//   double y;
//
//   DraggableText({required this.text, required this.color, this.x = 0.0, this.y = 0.0});
// }
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Multiple Draggable Texts')),
//         body: MultipleDragScreen(),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
//
// extension GlobalKeyExtension on GlobalKey {
//   Rect? get globalPaintBounds {
//     final renderObject = currentContext?.findRenderObject();
//     var translation = renderObject?.getTransformTo(null).getTranslation();
//     if (translation != null && renderObject?.paintBounds != null) {
//       return renderObject!.paintBounds.shift(Offset(translation.x, translation.y));
//     } else {
//       return null;
//     }
//   }
// }
//
// class MultipleDragScreen extends StatefulWidget {
//   const MultipleDragScreen({Key? key}) : super(key: key);
//
//   @override
//   _MultipleDragScreenState createState() => _MultipleDragScreenState();
// }
//
// class _MultipleDragScreenState extends State<MultipleDragScreen> {
//   List<DraggableText> draggableTexts = [
//     DraggableText(text: 'Text 1', color: Colors.red, x: 0, y: 0, scale: 1.0),
//     DraggableText(text: 'Text 2', color: Colors.green, x: 5, y: 4, scale: 1.0),
//     DraggableText(text: 'Text 3', color: Colors.blue, x: 8, y: 10, scale: 1.0),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(70.0),
//         child: Stack(
//           fit: StackFit.expand,
//           children: [
//             Container(color: Colors.black),
//             for (var draggableText in draggableTexts)
//               Positioned(
//                 left: draggableText.x,
//                 top: draggableText.y,
//                 child: GestureDetector(
//                   onScaleUpdate: (ScaleUpdateDetails details) {
//                     setState(() {
//                       draggableText.scale = details.scale;
//                     });
//                   },
//                   child: Transform.scale(
//                     scale: draggableText.scale,
//                     child: Draggable(
//                       child: Text(
//                         draggableText.text,
//                         style: TextStyle(color: Colors.orange),
//                       ),
//                       feedback: Text(
//                         draggableText.text,
//                         style: TextStyle(color: draggableText.color),
//                       ),
//                       childWhenDragging: Container(),
//                       onDragEnd: (dragDetails) {
//                         setState(() {
//                           final parentPos = context.findRenderObject()?.paintBounds;
//                           if (parentPos == null) return;
//                           draggableText.x = dragDetails.offset.dx - parentPos.left;
//                           draggableText.y = dragDetails.offset.dy - parentPos.top;
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             Positioned(
//               right: 16,
//               bottom: 16,
//               child: ElevatedButton(
//                 onPressed: () {
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       List<TextEditingController> textControllers = [];
//
//                       for (var draggableText in draggableTexts) {
//                         textControllers.add(TextEditingController(text: draggableText.text));
//                       }
//                       return AlertDialog(
//                         title: Text('Edit Draggable Texts'),
//                         content: Column(
//                           children: [
//                             for (int i = 0; i < draggableTexts.length; i++)
//                               TextField(
//                                 controller: textControllers[i],
//                                 onChanged: (value) {
//                                   draggableTexts[i].text = value;
//                                 },
//                               ),
//                           ],
//                         ),
//                         actions: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: Text('Cancel'),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               setState(() {
//                                 for (int i = 0; i < draggableTexts.length; i++) {
//                                   draggableTexts[i].text = textControllers[i].text;
//                                 }
//                               });
//                               Navigator.pop(context);
//                             },
//                             child: Text('Save'),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 },
//                 child: Text('Edit Texts'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class DraggableText {
//   String text;
//   Color color;
//   double x;
//   double y;
//   double scale;
//
//   DraggableText({required this.text, required this.color, this.x = 0.0, this.y = 0.0, this.scale = 1.0});
// }
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Multiple Draggable Texts')),
//         body: MultipleDragScreen(),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    var translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      return renderObject!.paintBounds.shift(Offset(translation.x, translation.y));
    } else {
      return null;
    }
  }
}

class MultipleDragScreen extends StatefulWidget {
  const MultipleDragScreen({Key? key}) : super(key: key);

  @override
  _MultipleDragScreenState createState() => _MultipleDragScreenState();
}

class _MultipleDragScreenState extends State<MultipleDragScreen> {
  List<DraggableText> draggableTexts = [
    DraggableText(text: 'Text 1', color: Colors.red, x: 0, y: 0, scale: 1.0),
    DraggableText(text: 'Text 2', color: Colors.green, x: 5, y: 4, scale: 1.0),
    DraggableText(text: 'Text 3', color: Colors.blue, x: 8, y: 10, scale: 1.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(color: Colors.black),
            for (var draggableText in draggableTexts)
              Positioned(
                left: draggableText.x,
                top: draggableText.y,
                child: LongPressDraggable(
                  child: Text(
                    draggableText.text,
                    style: TextStyle(color: Colors.orange),
                  ),
                  feedback: Text(
                    draggableText.text,
                    style: TextStyle(color: draggableText.color),
                  ),
                  childWhenDragging: Container(),
                  onDragStarted: () {
                    setState(() {
                      draggableText.scale = 1.2; // Increase scale when dragging starts
                    });
                  },
                  onDraggableCanceled: (_, __) {
                    setState(() {
                      draggableText.scale = 1.0; // Reset scale when dragging is canceled
                    });
                  },
                  onDragEnd: (dragDetails) {
                    setState(() {
                      final parentPos = context.findRenderObject()?.paintBounds;
                      if (parentPos == null) return;
                      draggableText.x = dragDetails.offset.dx - parentPos.left;
                      draggableText.y = dragDetails.offset.dy - parentPos.top;
                      draggableText.scale = 1.0; // Reset scale after dragging ends
                    });
                  },
                ),
              ),
            Positioned(
              right: 16,
              bottom: 16,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      List<TextEditingController> textControllers = [];

                      for (var draggableText in draggableTexts) {
                        textControllers.add(TextEditingController(text: draggableText.text));
                      }
                      return AlertDialog(
                        title: Text('Edit Draggable Texts'),
                        content: Column(
                          children: [
                            for (int i = 0; i < draggableTexts.length; i++)
                              TextField(
                                controller: textControllers[i],
                                onChanged: (value) {
                                  draggableTexts[i].text = value;
                                },
                              ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                for (int i = 0; i < draggableTexts.length; i++) {
                                  draggableTexts[i].text = textControllers[i].text;
                                }
                              });
                              Navigator.pop(context);
                            },
                            child: Text('Save'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Edit Texts'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DraggableText {
  String text;
  Color color;
  double x;
  double y;
  double scale;

  DraggableText({required this.text, required this.color, this.x = 0.0, this.y = 0.0, this.scale = 1.0});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Multiple Draggable Texts')),
        body: MultipleDragScreen(),
      ),
    );
  }
}



class MyHomePageOne extends StatefulWidget {
  @override
  _MyHomePageOneState createState() => _MyHomePageOneState();
}

class _MyHomePageOneState extends State<MyHomePageOne> {
  // Controller for date input
  TextEditingController dateController = TextEditingController();
  // Variable to store the result
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date to Day Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text input for date
            TextField(
              controller: dateController,
              decoration: const InputDecoration(labelText: 'Enter Date (yyyy-MM-dd)'),
            ),
            const SizedBox(height: 20),
            // Button to convert date to day
            ElevatedButton(
              onPressed: () {
                // Get the date from the text input
                String dateString = dateController.text;
                DateTime date = DateTime.parse(dateString);
                // Format the date to get the day
                String day = DateFormat('EEEE').format(date);
                // Display the result
                setState(() {
                  result = 'Day for $dateString is $day';
                });
              },
              child: Text('Convert to Day'),
            ),
            SizedBox(height: 20),
            // Display the result
            Text(
              result,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}






