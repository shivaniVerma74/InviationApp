// import 'dart:convert';
// import 'dart:typed_data';
// import 'dart:io';
//
// import 'package:doctorapp/Helper/Color.dart';
// import 'package:flex_color_picker/flex_color_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:http/http.dart'as http;
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:screenshot/screenshot.dart';
// import 'package:share_plus/share_plus.dart';
//
// import '../New_model/GetSettingModel.dart';
// import '../api/api_services.dart';
//
// class CardScreen extends StatefulWidget {
//   final String name;
//   final String address;
//   final String? image;
//   final String? datee;
//   final String? timee;
//   CardScreen({Key? key, required this.name, required this.address, this.image, this.datee, this.timee}) : super(key: key);
//
//   @override
//   State<CardScreen> createState() => _CardScreenState();
// }
//
// class _CardScreenState extends State<CardScreen> {
//   String invitationText = 'Shivani Verma';
//   String firstText = "Vijay Nagar";
//   String secondText = "13-06-2023PM  7:30";
//
//   double _scaleFactor = 1.0;
//   double _baseScaleFactor = 1.0;
//
//   double _scaleFactor1 = 1.0;
//   double _baseScaleFactor1 = 1.0;
//
//   double _scaleFactor2 = 1.0;
//   double _baseScaleFactor2 = 1.0;
//
//   double _textSize = 18.0;
//   Offset _textPosition = Offset(20, 20);
//
//   bool _showContainer = false;
//   Color selectedColor = Colors.black;
//
//   late Color screenPickerColor; // Color for picker shown in Card on the screen.
//   late Color dialogPickerColor;
//   late Color dialogPickerColor1;// Color for picker in dialog using onChanged
//   late Color dialogSelectColor;
//
//   static const Color guidePrimary = Color(0xFF6200EE);
//   static const Color guidePrimaryVariant = Color(0xFF3700B3);
//   static const Color guideSecondary = Color(0xFF03DAC6);
//   static const Color guideSecondaryVariant = Color(0xFF018786);
//   static const Color guideError = Color(0xFFB00020);
//   static const Color guideErrorDark = Color(0xFFCF6679);
//   static const Color blueBlues = Color(0xFF174378);
//
//   final Map<ColorSwatch<Object>, String> colorsNameMap =
//   <ColorSwatch<Object>, String>{
//     ColorTools.createPrimarySwatch(guidePrimary): 'Guide Purple',
//     ColorTools.createPrimarySwatch(guidePrimaryVariant): 'Guide Purple Variant',
//     ColorTools.createAccentSwatch(guideSecondary): 'Guide Teal',
//     ColorTools.createAccentSwatch(guideSecondaryVariant): 'Guide Teal Variant',
//     ColorTools.createPrimarySwatch(guideError): 'Guide Error',
//     ColorTools.createPrimarySwatch(guideErrorDark): 'Guide Error Dark',
//     ColorTools.createPrimarySwatch(blueBlues): 'Blue blues',
//   };
//
//   @override
//   void initState() {
//     screenPickerColor = Colors.blue;
//     dialogPickerColor = Colors.red;
//     dialogSelectColor = const Color(0xFFA239CA);
//     super.initState();
//   }
//
//   Future _refresh() {
//     return callAPI();
//   }
//
//   callAPI(){
//     // getSettingApi();
//   }
//
//   bool iconVisible = true;
//   bool iconVisible1 = true;
//   bool iconVisible2 = true;
//   bool iconVisible3 = true;
//   ScreenshotController screenshotController = ScreenshotController();
//
//   GetSettingModel? getSettingModel;
//   var termAndCondition;
//
//   // getSettingApi() async {
//   //   var headers = {
//   //     'Cookie': 'ci_session=eb651cdce0850614d296b81363913b2ca08fe641'
//   //   };
//   //   var request = http.Request('POST', Uri.parse('${ApiService.getSettingApi}'));
//   //   request.headers.addAll(headers);
//   //   http.StreamedResponse response = await request.send();
//   //   if (response.statusCode == 200) {
//   //     print("hereeeeeeeeeeeeeeeeee${termAndCondition}");
//   //     final result =  await response.stream.bytesToString();
//   //     final jsonResponse = json.decode(result);
//   //     print("Thiiiiiiiiiiiiiiiiisssssssss${jsonResponse}");
//   //     setState(() {
//   //       termAndCondition = jsonResponse['data']['terms_conditions'][0];
//   //     });
//   //   }
//   //   else {
//   //     print(response.reasonPhrase);
//   //   }
//   // }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: _refresh,
//       child: Scaffold(
//         appBar: AppBar(title: Text("Card Design"),
//           centerTitle: true,
//           elevation: 0,
//           backgroundColor: colors.primary
//         ),
//         body: Column(
//           children: [
//             SizedBox(height: 10),
//             RepaintBoundary(
//               child: Container(
//                 height: MediaQuery.of(context).size.height/1.5,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: NetworkImage("${widget.image}"),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 child:  Stack(
//                   children: [
//                     Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               _editInvitationText(context);
//                               setState(() {
//                                 _showContainer = true;
//                               });
//                               if (_showContainer)
//                                 Positioned(
//                                   top: 0,
//                                   right: 0,
//                                   child: Container(
//                                     decoration: BoxDecoration(border: Border.all(color: Colors.black)),
//                                     width: 100,
//                                     height: 100,
//                                     color: Colors.red,
//                                   ),
//                                 );
//                             },
//                             onScaleStart: (details) {
//                               _baseScaleFactor = _scaleFactor;
//                             },
//                             onScaleUpdate: (details) {
//                               setState(() {
//                                 _scaleFactor = _baseScaleFactor * details.scale;
//                               });
//                             },
//                             child: Container(
//                               child: Center(
//                                 child: Text(
//                                   widget.name,
//                                   textScaleFactor: _scaleFactor, style: TextStyle(color: dialogPickerColor, fontSize: 19),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 30),
//                           GestureDetector(
//                             onTap: () {
//                               _editInvitationText1(context);
//                             },
//                             onScaleStart: (details) {
//                               _baseScaleFactor1 = _scaleFactor1;
//                             },
//                             onScaleUpdate: (details) {
//                               setState(() {
//                                 _scaleFactor1 = _baseScaleFactor1 * details.scale;
//                               });
//                             },
//                             child: Container(
//                               child: Center(
//                                 child: Text(
//                                   widget.address,
//                                   textScaleFactor: _scaleFactor1,
//                                   style: TextStyle(color: dialogPickerColor, fontSize: 19),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 30),
//                           GestureDetector(
//                             onTap: () {
//                               _editInvitationText2(context);
//                             },
//                             onScaleStart: (details) {
//                               _baseScaleFactor2 = _scaleFactor2;
//                             },
//                             onScaleUpdate: (details) {
//                               setState(() {
//                                 _scaleFactor2 = _baseScaleFactor2 * details.scale;
//                               });
//                             },
//                             child: Container(
//                               child: Center(
//                                 child: Text(
//                                   secondText,
//                                   textScaleFactor: _scaleFactor2,
//                                   style: TextStyle(color: dialogPickerColor, fontSize: 19),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             // ColorPicker(
//             //   selectedColor: selectedColor,
//             //   onColorChanged: (color) {
//             //     setState(() {
//             //       selectedColor = color;
//             //     });
//             //   },
//             // ),
//             SizedBox(height: 10),
//             ListTile(
//               title: Row(
//                 children: [
//                   Text("Change Text Color", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
//                   SizedBox(width: 10),
//                   ColorIndicator(
//                     width: 30,
//                     height: 30,
//                     borderRadius: 4,
//                     color: dialogPickerColor,
//                     onSelectFocus: false,
//                     onSelect: () async {
//                       // Store current color before we open the dialog.
//                       final Color colorBeforeDialog = dialogPickerColor;
//                       // Wait for the picker to close, if dialog was dismissed,
//                       // then restore the color we had before it was opened.
//                       if (!(await colorPickerDialog())) {
//                         setState(() {
//                           dialogPickerColor = colorBeforeDialog;
//                         });
//                       }
//                     },
//                   ),
//                 ],
//               ),
//               // title: const Text('Click this color to modify it in a dialog.'),
//               // subtitle: Text(
//               //   // ignore: lines_longer_than_80_chars
//               //   '${ColorTools.materialNameAndCode(dialogPickerColor, colorSwatchNameMap: colorsNameMap)} '
//               //       'aka ${ColorTools.nameThatColor(dialogPickerColor)}',
//               // ),
//               // trailing:
//               // ColorIndicator(
//               //   width: 34,
//               //   height: 34,
//               //   borderRadius: 4,
//               //   color: dialogPickerColor,
//               //   onSelectFocus: false,
//               //   onSelect: () async {
//               //     // Store current color before we open the dialog.
//               //     final Color colorBeforeDialog = dialogPickerColor;
//               //     // Wait for the picker to close, if dialog was dismissed,
//               //     // then restore the color we had before it was opened.
//               //     if (!(await colorPickerDialog())) {
//               //       setState(() {
//               //         dialogPickerColor = colorBeforeDialog;
//               //       });
//               //     }
//               //   },
//               // ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//               child: Row(
//                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Share", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800,),),
//                   SizedBox(width: 8,),
//                   Container(
//                     height: 45,
//                     width: 45,
//                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colors.primary),
//                     child: IconButton(
//                         onPressed: () {
//                           // setState(() {
//                           // });
//                           _shareQrCode();
//                     },
//                         icon: const Icon(Icons.share, color: Colors.white)),
//                   ),
//                  SizedBox(width: 170,),
//                  Text("Download", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800,),),
//                   SizedBox(width: 8),
//                   Container(
//                    height: 45,
//                    width: 45,
//                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colors.primary),
//                    child: IconButton(
//                        onPressed:() {
//                    },
//                        icon: const Icon(Icons.download, color: Colors.white)),
//                  ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         // appBar: AppBar(
//         //   centerTitle: true,
//         //   backgroundColor: primary,
//         //   title: Text("Terms Conditions"),
//         // ),
//         // body: ListView(
//         //   children: [
//         //     termAndCondition == null ? Center(child: CircularProgressIndicator()) :Html(
//         //         data:"${termAndCondition}"
//         //     ),
//         //   ],
//         // )
//       ),
//     );
//   }
//
//   Future<void> downloadCard() async {
//     final appDocDir = await getApplicationDocumentsDirectory();
//     final String savePath = appDocDir.path + '/birthday_card.png';
//     final String url = 'https://example.com/birthday_card.png';
//
//     final taskId = await FlutterDownloader.enqueue(
//       url: url,
//       savedDir: appDocDir.path,
//       fileName: 'birthday_card.png',
//       showNotification: true,
//       openFileFromNotification: true,
//     );
//   }
//
//   _shareQrCode() async {
//     print("sharee Function Workkkk");
//     PermissionStatus storagePermission = await Permission.storage.request();
//     if (storagePermission == PermissionStatus.granted) {
//       print("accessed");
//       final directory = (await getApplicationDocumentsDirectory()).path;
//       screenshotController.capture().then((Uint8List? image) async {
//         print("fdddddddd ${image}");
//         if (image!= null) {
//           try {
//             String fileName = DateTime
//                 .now()
//                 .microsecondsSinceEpoch
//                 .toString();
//             final imagePath = await File('$directory/$fileName.png').create();
//             if (imagePath!= null) {
//               await imagePath.writeAsBytes(image);
//               Share.shareFiles([imagePath.path]);
//             }
//           } catch (error) {}
//         }
//       }).catchError((onError) {
//         print('Error --->> $onError');
//       });
//     } else if (storagePermission == PermissionStatus.denied) {
//       print("denaied");
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('This Permission is recommended')));
//     } else if (storagePermission == PermissionStatus.permanentlyDenied) {
//       openAppSettings().then((value) {
//       });
//     }
//   }
//
//   void _editInvitationText(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         String newInvitationText = invitationText;
//         return AlertDialog(
//           title: Text('Edit Invitation Text'),
//           content: TextFormField(
//             initialValue: invitationText,
//             onChanged: (value) {
//               newInvitationText = value;
//             },
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   invitationText = newInvitationText;
//                 });
//                 Navigator.of(context).pop();
//               },
//               child: Text('Save'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _editInvitationText1(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         String newInvitationText = firstText;
//         return AlertDialog(
//           title: Text('Edit Invitation Text'),
//           content: TextFormField(
//             initialValue: firstText,
//             onChanged: (value) {
//               newInvitationText = value;
//             },
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   firstText = newInvitationText;
//                 });
//                 Navigator.of(context).pop();
//               },
//               child: Text('Save'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _editInvitationText2(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         String newInvitationText = secondText;
//         return AlertDialog(
//           title: Text('Edit Invitation Text'),
//           content: TextFormField(
//             initialValue: secondText,
//             onChanged: (value) {
//               newInvitationText = value;
//             },
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   secondText = newInvitationText;
//                 });
//                 Navigator.of(context).pop();
//               },
//               child: Text('Save'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   Future<bool> colorPickerDialog() async {
//     return ColorPicker(
//       color: dialogPickerColor,
//       onColorChanged: (Color color) =>
//           setState(() => dialogPickerColor = color),
//       width: 40,
//       height: 40,
//       borderRadius: 4,
//       spacing: 5,
//       runSpacing: 5,
//       wheelDiameter: 155,
//       heading: Text(
//         'Select color',
//         style: Theme.of(context).textTheme.titleMedium,
//       ),
//       // subheading: Text(
//       //   'Select color shade',
//       //   style: Theme.of(context).textTheme.titleMedium,
//       // ),
//       // wheelSubheading: Text(
//       //   'Selected color and its shades',
//       //   style: Theme.of(context).textTheme.titleMedium,
//       // ),
//       showMaterialName: true,
//       showColorName: true,
//       showColorCode: true,
//       copyPasteBehavior: const ColorPickerCopyPasteBehavior(
//         longPressMenu: true,
//       ),
//       materialNameTextStyle: Theme.of(context).textTheme.bodySmall,
//       colorNameTextStyle: Theme.of(context).textTheme.bodySmall,
//       colorCodeTextStyle: Theme.of(context).textTheme.bodyMedium,
//       colorCodePrefixStyle: Theme.of(context).textTheme.bodySmall,
//       selectedPickerTypeColor: Theme.of(context).colorScheme.primary,
//       pickersEnabled: const <ColorPickerType, bool>{
//         ColorPickerType.both: false,
//         ColorPickerType.primary: true,
//         ColorPickerType.accent: true,
//         ColorPickerType.bw: false,
//         ColorPickerType.custom: true,
//         ColorPickerType.wheel: true,
//       },
//       customColorSwatchesAndNames: colorsNameMap,
//     ).showPickerDialog(
//       context,
//       actionsPadding: const EdgeInsets.all(16),
//       constraints:
//       const BoxConstraints(minHeight: 480, minWidth: 300, maxWidth: 320),
//     );
//   }
// }
//
// //
// // class ColorPicker extends StatelessWidget {
// //   final Color selectedColor;
// //   final ValueChanged<Color> onColorChanged;
// //
// //   ColorPicker({required this.selectedColor, required this.onColorChanged});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children: [
// //         Container(
// //           height: 40,
// //           width: 40,
// //           child: ColorButton(
// //             color: Colors.red,
// //             isSelected: selectedColor == Colors.red,
// //             onTap: () => onColorChanged(Colors.red),
// //           ),
// //         ),
// //         Container(
// //           height: 40,
// //           width: 40,
// //           child: ColorButton(
// //             color: Colors.cyan,
// //             isSelected: selectedColor == Colors.cyan,
// //             onTap: () => onColorChanged(Colors.cyan),
// //           ),
// //         ),
// //         Container(
// //           height: 40,
// //           width: 40,
// //           child: ColorButton(
// //             color: Colors.deepPurple,
// //             isSelected: selectedColor == Colors.deepPurple,
// //             onTap: () => onColorChanged(Colors.deepPurple),
// //           ),
// //         ),
// //         Container(
// //           height: 40,
// //           width: 40,
// //           child: ColorButton(
// //             color: Colors.pink,
// //             isSelected: selectedColor == Colors.pink,
// //             onTap: () => onColorChanged(Colors.pink),
// //           ),
// //         ),
// //         Container(
// //           height: 40,
// //           width: 40,
// //           child: ColorButton(
// //             color: Colors.green,
// //             isSelected: selectedColor == Colors.green,
// //             onTap: () => onColorChanged(Colors.green),
// //           ),
// //         ),
// //         Container(
// //           height: 40,
// //           width: 40,
// //           child: ColorButton(
// //             color: Colors.amber,
// //             isSelected: selectedColor == Colors.amber,
// //             onTap: () => onColorChanged(Colors.amber),
// //           ),
// //         ),
// //         Container(
// //           height: 40,
// //           width: 40,
// //           child: ColorButton(
// //             color: Colors.deepOrange,
// //             isSelected: selectedColor == Colors.deepOrange,
// //             onTap: () => onColorChanged(Colors.deepOrange),
// //           ),
// //         ),
// //         Container(
// //           height: 40,
// //           width: 40,
// //           child: ColorButton(
// //             color: Colors.teal,
// //             isSelected: selectedColor == Colors.teal,
// //             onTap: () => onColorChanged(Colors.teal),
// //           ),
// //         ),
// //         Container(
// //           height: 40,
// //           width: 40,
// //           child: ColorButton(
// //             color: Colors.brown,
// //             isSelected: selectedColor == Colors.brown,
// //             onTap: () => onColorChanged(Colors.brown),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }
// //
// // class ColorButton extends StatelessWidget {
// //   final Color color;
// //   final bool isSelected;
// //   final VoidCallback onTap;
// //
// //   ColorButton({
// //     required this.color,
// //     required this.isSelected,
// //     required this.onTap,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Container(
// //         width: 50,
// //         height: 50,
// //         margin: EdgeInsets.all(8),
// //         decoration: BoxDecoration(
// //           color: color,
// //           shape: BoxShape.circle,
// //           border: Border.all(
// //             color: isSelected ? Colors.white : Colors.transparent,
// //             width: 2,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:doctorapp/Helper/Color.dart';
import 'package:doctorapp/Screen/CardView.dart';
import 'package:doctorapp/Screen/ExampleScreen.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
// import 'package:image_downloader/image_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../New_model/GetSettingModel.dart';
import '../api/api_services.dart';

extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    // print("Paint Boundssss ${globalPaintBounds}");
    final renderObject = currentContext?.findRenderObject();
    var translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      return renderObject!.paintBounds.shift(Offset(translation.x, translation.y));
    } else {
      return null;
    }
  }
}

class CardScreen extends StatefulWidget {
  final String name;
  final String address;
  final String? image;
  final String datee;
  final String timee;
  final String temp_Id;
  CardScreen({Key? key, required this.name, required this.address, required this.datee, required this.timee, this.image, required this.temp_Id}) : super(key: key);
  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  ScreenshotController screenshotController = ScreenshotController();
  var newInvitationText;
  var locationn;
  var datte;
  var timmm;
  final GlobalKey keyList = GlobalKey();

  var _x1 = 0.0;
  var _y1 = 0.0;
  final GlobalKey stackKey1 = GlobalKey();
  String updateName = '';
  String updatedlocation = '';
  String updatedTime = '';
  String updatedDate = '';

  Color selectedColor = Colors.black;
  Offset offset = Offset.zero;

  late Color screenPickerColor;
  late Color dialogPickerColor;
  late Color dialogPickerColor1;
  late Color dialogSelectColor;

  static const Color guidePrimary = Color(0xFF6200EE);
  static const Color guidePrimaryVariant = Color(0xFF3700B3);
  static const Color guideSecondary = Color(0xFF03DAC6);
  static const Color guideSecondaryVariant = Color(0xFF018786);
  static const Color guideError = Color(0xFFB00020);
  static const Color guideErrorDark = Color(0xFFCF6679);
  static const Color blueBlues = Color(0xFF174378);

  final Map<ColorSwatch<Object>, String> colorsNameMap =
  <ColorSwatch<Object>, String> {
    ColorTools.createPrimarySwatch(guidePrimary): 'Guide Purple',
    ColorTools.createPrimarySwatch(guidePrimaryVariant): 'Guide Purple Variant',
    ColorTools.createAccentSwatch(guideSecondary): 'Guide Teal',
    ColorTools.createAccentSwatch(guideSecondaryVariant): 'Guide Teal Variant',
    ColorTools.createPrimarySwatch(guideError): 'Guide Error',
    ColorTools.createPrimarySwatch(guideErrorDark): 'Guide Error Dark',
    ColorTools.createPrimarySwatch(blueBlues): 'Blue blues',
  };

  List<DraggableText> draggableTexts = [];

  @override
  void initState() {
    print("===============${widget.image}===========");
    screenPickerColor = Colors.blue;
    dialogPickerColor = Colors.red;
    dialogSelectColor = const Color(0xFFA239CA);
    super.initState();
    setState(() {
      newInvitationText = widget.name.toString();
      locationn = widget.address.toString();
      datte = widget.datee.toString();
      timmm = widget.timee.toString();
      draggableTexts.add(DraggableText(text: '$newInvitationText', color: dialogPickerColor,x: 120, y: 150));
      draggableTexts.add(DraggableText(text: '$locationn', color: dialogPickerColor,x: 120, y: 200));
      draggableTexts.add(DraggableText(text: '$datte', color: dialogPickerColor, x: 120, y: 250));
      draggableTexts.add(DraggableText(text: '$timmm', color: dialogPickerColor, x: 120, y: 300));
    });
  }
  Future _refresh() {
    return callAPI();
  }
  callAPI(){
    // getSettingApi();
  }

  saveCard(image) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userId = preferences.getString('userId');
    String? template_id = preferences.getString('template_id');
    var headers = {
      'Cookie': 'ci_session=79b222a1b7a3dc18c150b1366e8f9ceb03aaa932'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiService.savemycard));
    request.fields.addAll({
      'user_id': '$userId',
      'template_id': widget.temp_Id.toString()
    });
    request.files.add(await http.MultipartFile.fromPath('image', '$image'));
    print("save Cardddd paraa${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: "card save successfully");
      Navigator.push(context, MaterialPageRoute(builder: (context) => CardView(image: image, temp_Id:widget.temp_Id.toString())));
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }

  GetSettingModel? getSettingModel;
  var termAndCondition;

  // getSettingApi() async {
  //   var headers = {
  //     'Cookie': 'ci_session=eb651cdce0850614d296b81363913b2ca08fe641'
  //   };
  //   var request = http.Request('POST', Uri.parse('${ApiService.getSettingApi}'));
  //   request.headers.addAll(headers);
  //   http.StreamedResponse response = await request.send();
  //   if (response.statusCode == 200) {
  //     print("hereeeeeeeeeeeeeeeeee${termAndCondition}");
  //     final result =  await response.stream.bytesToString();
  //     final jsonResponse = json.decode(result);
  //     print("Thiiiiiiiiiiiiiiiiisssssssss${jsonResponse}");
  //     setState(() {
  //       termAndCondition = jsonResponse['data']['terms_conditions'][0];
  //     });
  //   }
  //   else {
  //     print(response.reasonPhrase);
  //   }
  // }
  // Color caughtColor = Colors.red;

  final GlobalKey stackKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    print("nameeeee ${newInvitationText}");
    print("address ${locationn}");
    return RefreshIndicator(
      onRefresh: _refresh,
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            foregroundColor: colors.whiteTemp,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            title: const Text('Card Design'),
            backgroundColor: colors.secondary),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              RepaintBoundary(
                key: keyList,
                child: Container(
                  height: MediaQuery.of(context).size.height/1.3,
                  width: MediaQuery.of(context).size.width/1,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("${widget.image}"),
                      fit: BoxFit.fill,
                    ),
                  ),
                 child: Padding(
                     padding: const EdgeInsets.only(left: 30, top: 30),
                   child: Stack(
                     key: stackKey,
                     fit: StackFit.expand,
                     children: [
                       for (var draggableText in draggableTexts)
                        Positioned(
                          left: draggableText.x,
                          top: draggableText.y,
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                // _editInvitationText1(context);
                              });
                            },
                            child: Text(
                              draggableText.text,
                              style: TextStyle(color: dialogPickerColor, fontSize: 20, fontFamily: 'Granaina', fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                       // Positioned(
                       //   left: draggableText.x,
                       //   top: draggableText.y,
                       //   child: Draggable(
                       //     child: GestureDetector(
                       //       onTap: (){
                       //         setState(() {
                       //           _editInvitationText1(context);
                       //         });
                       //       },
                       //       child: Text(
                       //         draggableText.text,
                       //         style: TextStyle(color: dialogPickerColor, fontSize: 18, fontFamily: 'Granaina'),
                       //         textAlign: TextAlign.center,
                       //       ),
                       //     ),
                       //     feedback: Text(
                       //       draggableText.text,
                       //       style: TextStyle(color: dialogPickerColor, fontSize: 18),
                       //     ),
                       //     childWhenDragging: Container(),
                       //     onDragEnd: (dragDetails) {
                       //       setState(() {
                       //         final parentPos = context.findRenderObject()?.paintBounds;
                       //         if (parentPos == null) return;
                       //         draggableText.x = dragDetails.offset.dx - parentPos.left;
                       //         draggableText.y = dragDetails.offset.dy - parentPos.top;
                       //       });
                       //     },
                       //   ),
                       // ),
                     ],
                   ),
                 ),
                ),
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: colors.secondary, // background
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            List<TextEditingController> textControllers = [];
                            for (var draggableText in draggableTexts) {
                              textControllers.add(TextEditingController(text: draggableText.text));
                            }
                            return AlertDialog(
                              title: const Text('Edit Texts'),
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
                      child: Text('Edit Text', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700)),
                    ),
                    Container(
                      width: 90,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: colors.secondary, // background
                          ),
                          onPressed: (){
                        save();
                      }, child: Text("Next", style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700))),
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     save();
                    //   },
                    //   child: Container(
                    //     height: 39,
                    //     width: MediaQuery.of(context).size.width/3,
                    //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: colors.primary),
                    //     child: const Center(
                    //       child: Text("Save Card",
                    //           style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700)
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              // const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }


  Future<ui.Image?> captureImage() async {
    try {
      RenderRepaintBoundary boundary = keyList.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      return image;
    } catch (exception) {
      print(exception);
      return null;
    }
  }

  save() async {
    var status =  await Permission.photos.request();
    if (/*storagePermission == PermissionStatus.granted*/ status.isGranted) {
      final directory = (await getApplicationDocumentsDirectory()).path;
      RenderRepaintBoundary bound = keyList.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await bound.toImage();
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      print('${byteData?.buffer.lengthInBytes}___________');
      if(byteData != null){
        Uint8List pngBytes = byteData.buffer.asUint8List();
        String fileName = DateTime.now().microsecondsSinceEpoch.toString();
        final imagePath = await File('$directory/$fileName.png').create();
        await imagePath.writeAsBytes(pngBytes);
        // Share.shareFiles([imagePath.path]);
        saveCard(imagePath.path.toString());
      }
    } else if (await status.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('This Permission is recommended')));
    } else if (await status.isPermanentlyDenied/*storagePermission == PermissionStatus.permanentlyDenied*/) {
      openAppSettings().then((value) {
      });
    }
  }

  void saveImage() async {
    print("Download Functionnnnnn");
    ui.Image? image = await captureImage();
    if (image != null) {
      final directory = (await getApplicationDocumentsDirectory()).path;
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      String fileName = DateTime.now().microsecondsSinceEpoch.toString();
      final file = await File('$directory/$fileName.png').create();
      await file.writeAsBytes(pngBytes);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Card Download Successfully')));
      print('Image saved: ${file.path}');
    }
  }

  _share() async {
    var status =  await Permission.photos.request();
    if (/*storagePermission == PermissionStatus.granted*/ status.isGranted) {
      final directory = (await getApplicationDocumentsDirectory()).path;
      RenderRepaintBoundary bound = keyList.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await bound.toImage();
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      print('${byteData?.buffer.lengthInBytes}___________');
      // this will save image screenshot in gallery
      if(byteData != null){
        Uint8List pngBytes = byteData.buffer.asUint8List();
        String fileName = DateTime.now().microsecondsSinceEpoch.toString();
        final imagePath = await File('$directory/$fileName.png').create();
        await imagePath.writeAsBytes(pngBytes);
        Share.shareFiles([imagePath.path]);
      }
    } else if (await status.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('This Permission is recommended')));
    } else if (await status.isPermanentlyDenied/*storagePermission == PermissionStatus.permanentlyDenied*/) {
      openAppSettings().then((value) {
      });
    }
  }

  void _editInvitationText(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newvaluee= "";
        return AlertDialog(
          title: Text('Edit Invitation Text'),
          content: TextFormField(
            initialValue: newInvitationText,
            onChanged: (value) {
              newvaluee = value;
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  newInvitationText=newvaluee;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _editInvitationText1(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (c,setState){
          return  AlertDialog(
            title: Text('Edit Invitation Text'),
            content: Column(
              children: [
                TextFormField(
                  initialValue: newInvitationText,
                  onChanged: (value) {
                    setState(() {
                      updateName = value;
                    });
                  },
                ),
                TextFormField(
                  initialValue: locationn,
                  onChanged: (value) {
                    setState(() {
                      updatedlocation = value;
                    });
                  },
                ),
                TextFormField(
                  initialValue: datte,
                  onChanged: (value) {
                    setState(() {
                      updatedDate = value;
                    });
                  },
                ),
                TextFormField(
                  initialValue: timmm,
                  onChanged: (value) {
                    setState(() {
                      updatedTime = value;
                    });
                  },
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    newInvitationText = updateName == "" ? newInvitationText : updateName;
                    locationn = updatedlocation == "" ? locationn : updatedlocation;
                    datte = updatedDate == "" ? datte : updatedDate;
                    timmm = updatedTime == "" ? timmm : updatedTime;
                    draggableTexts.add(DraggableText(text: '${newInvitationText}', color: dialogPickerColor,x: 150,y: 150));
                    draggableTexts.add(DraggableText(text: '${locationn}', color: dialogPickerColor,x: 150,y: 200));
                    draggableTexts.add(DraggableText(text: '${datte}', color: dialogPickerColor,x: 150,y: 250));
                    draggableTexts.add(DraggableText(text: '${timmm}', color: dialogPickerColor,x: 150,y: 300));
                    //  locationn = newvaluee.toString();
                  });
                  print("final updated valued here ${newInvitationText} and ${locationn} and ${datte} and ${timmm}");
                  Navigator.of(context).pop();
                },
                child: Text('Save'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
            ],
          );
        });
      },
    );
  }

  void _editInvitationText3(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newvaluee= "";
        return AlertDialog(
          title: Text('Edit Invitation Text'),
          content: TextFormField(
            initialValue: datte,
            onChanged: (value) {
              newvaluee = value;
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  datte = newvaluee.toString();
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
  void _editInvitationText4(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newvaluee= "";
        return AlertDialog(
          title: Text('Edit Invitation Text'),
          content: TextFormField(
            initialValue: timmm,
            onChanged: (value) {
              newvaluee= value;
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  timmm = newvaluee.toString();
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Future<bool> colorPickerDialog() async {
    return ColorPicker(
      color: dialogPickerColor,
      onColorChanged: (Color color) =>
          setState(() => dialogPickerColor = color),
      width: 40,
      height: 40,
      borderRadius: 4,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 155,
      heading: Text(
        'Select color',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      // subheading: Text(
      //   'Select color shade',
      //   style: Theme.of(context).textTheme.titleMedium,
      // ),
      // wheelSubheading: Text(
      //   'Selected color and its shades',
      //   style: Theme.of(context).textTheme.titleMedium,
      // ),
      showMaterialName: true,
      showColorName: true,
      showColorCode: true,
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      materialNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorCodeTextStyle: Theme.of(context).textTheme.bodyMedium,
      colorCodePrefixStyle: Theme.of(context).textTheme.bodySmall,
      selectedPickerTypeColor: Theme.of(context).colorScheme.primary,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: true,
        ColorPickerType.accent: true,
        ColorPickerType.bw: false,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: true,
      },
      customColorSwatchesAndNames: colorsNameMap,
    ).showPickerDialog(
      context,
      actionsPadding: const EdgeInsets.all(16),
      constraints:
      const BoxConstraints(minHeight: 480, minWidth: 300, maxWidth: 320),
    );
  }

}

//
// class ColorPicker extends StatelessWidget {
//   final Color selectedColor;
//   final ValueChanged<Color> onColorChanged;
//
//   ColorPicker({required this.selectedColor, required this.onColorChanged});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           height: 40,
//           width: 40,
//           child: ColorButton(
//             color: Colors.red,
//             isSelected: selectedColor == Colors.red,
//             onTap: () => onColorChanged(Colors.red),
//           ),
//         ),
//         Container(
//           height: 40,
//           width: 40,
//           child: ColorButton(
//             color: Colors.cyan,
//             isSelected: selectedColor == Colors.cyan,
//             onTap: () => onColorChanged(Colors.cyan),
//           ),
//         ),
//         Container(
//           height: 40,
//           width: 40,
//           child: ColorButton(
//             color: Colors.deepPurple,
//             isSelected: selectedColor == Colors.deepPurple,
//             onTap: () => onColorChanged(Colors.deepPurple),
//           ),
//         ),
//         Container(
//           height: 40,
//           width: 40,
//           child: ColorButton(
//             color: Colors.pink,
//             isSelected: selectedColor == Colors.pink,
//             onTap: () => onColorChanged(Colors.pink),
//           ),
//         ),
//         Container(
//           height: 40,
//           width: 40,
//           child: ColorButton(
//             color: Colors.green,
//             isSelected: selectedColor == Colors.green,
//             onTap: () => onColorChanged(Colors.green),
//           ),
//         ),
//         Container(
//           height: 40,
//           width: 40,
//           child: ColorButton(
//             color: Colors.amber,
//             isSelected: selectedColor == Colors.amber,
//             onTap: () => onColorChanged(Colors.amber),
//           ),
//         ),
//         Container(
//           height: 40,
//           width: 40,
//           child: ColorButton(
//             color: Colors.deepOrange,
//             isSelected: selectedColor == Colors.deepOrange,
//             onTap: () => onColorChanged(Colors.deepOrange),
//           ),
//         ),
//         Container(
//           height: 40,
//           width: 40,
//           child: ColorButton(
//             color: Colors.teal,
//             isSelected: selectedColor == Colors.teal,
//             onTap: () => onColorChanged(Colors.teal),
//           ),
//         ),
//         Container(
//           height: 40,
//           width: 40,
//           child: ColorButton(
//             color: Colors.brown,
//             isSelected: selectedColor == Colors.brown,
//             onTap: () => onColorChanged(Colors.brown),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class ColorButton extends StatelessWidget {
//   final Color color;
//   final bool isSelected;
//   final VoidCallback onTap;
//
//   ColorButton({
//     required this.color,
//     required this.isSelected,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 50,
//         height: 50,
//         margin: EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: color,
//           shape: BoxShape.circle,
//           border: Border.all(
//             color: isSelected ? Colors.white : Colors.transparent,
//             width: 2,
//           ),
//         ),
//       ),
//     );
//   }
// }

