import 'dart:convert';

import 'package:doctorapp/Helper/Color.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart'as http;

import '../New_model/GetSettingModel.dart';
import '../api/api_services.dart';

class CardScreen extends StatefulWidget {
  final String name;
  final String address;
  CardScreen({Key? key, required this.name, required this.address}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  String invitationText = 'Shivani Verma';
  String firstText = "Vijay Nagar";
  String secondText = "13-06-2023PM  7:30";

  double _scaleFactor = 1.0;
  double _baseScaleFactor = 1.0;

  double _scaleFactor1 = 1.0;
  double _baseScaleFactor1 = 1.0;

  double _scaleFactor2 = 1.0;
  double _baseScaleFactor2 = 1.0;

  double _textSize = 18.0;
  Offset _textPosition = Offset(20, 20);

  bool _showContainer = false;
  Color selectedColor = Colors.black;

  late Color screenPickerColor; // Color for picker shown in Card on the screen.
  late Color dialogPickerColor;
  late Color dialogPickerColor1;// Color for picker in dialog using onChanged
  late Color dialogSelectColor;

  static const Color guidePrimary = Color(0xFF6200EE);
  static const Color guidePrimaryVariant = Color(0xFF3700B3);
  static const Color guideSecondary = Color(0xFF03DAC6);
  static const Color guideSecondaryVariant = Color(0xFF018786);
  static const Color guideError = Color(0xFFB00020);
  static const Color guideErrorDark = Color(0xFFCF6679);
  static const Color blueBlues = Color(0xFF174378);

  final Map<ColorSwatch<Object>, String> colorsNameMap =
  <ColorSwatch<Object>, String>{
    ColorTools.createPrimarySwatch(guidePrimary): 'Guide Purple',
    ColorTools.createPrimarySwatch(guidePrimaryVariant): 'Guide Purple Variant',
    ColorTools.createAccentSwatch(guideSecondary): 'Guide Teal',
    ColorTools.createAccentSwatch(guideSecondaryVariant): 'Guide Teal Variant',
    ColorTools.createPrimarySwatch(guideError): 'Guide Error',
    ColorTools.createPrimarySwatch(guideErrorDark): 'Guide Error Dark',
    ColorTools.createPrimarySwatch(blueBlues): 'Blue blues',
  };

  @override
  void initState() {
    screenPickerColor = Colors.blue;
    dialogPickerColor = Colors.red;
    dialogSelectColor = const Color(0xFFA239CA);
    super.initState();
  }

  Future _refresh() {
    return callAPI();
  }

  callAPI(){
    // getSettingApi();

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


  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: Scaffold(
        appBar: AppBar(title: Text("Card Design"),
          centerTitle: true,
          backgroundColor: colors.primary
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/1.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/invitation.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child:  Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _editInvitationText(context);
                            setState(() {
                              _showContainer = true;
                            });
                            if (_showContainer)
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                  width: 100,
                                  height: 100,
                                  color: Colors.red,
                                ),
                              );
                          },
                          onScaleStart: (details) {
                            _baseScaleFactor = _scaleFactor;
                          },
                          onScaleUpdate: (details) {
                            setState(() {
                              _scaleFactor = _baseScaleFactor * details.scale;
                            });
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                widget.name,
                                textScaleFactor: _scaleFactor, style: TextStyle(color: dialogPickerColor, fontSize: 19),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            _editInvitationText1(context);
                          },
                          onScaleStart: (details) {
                            _baseScaleFactor1 = _scaleFactor1;
                          },
                          onScaleUpdate: (details) {
                            setState(() {
                              _scaleFactor1 = _baseScaleFactor1 * details.scale;
                            });
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                widget.address,
                                textScaleFactor: _scaleFactor1,
                                style: TextStyle(color: dialogPickerColor, fontSize: 19),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            _editInvitationText2(context);
                          },
                          onScaleStart: (details) {
                            _baseScaleFactor2 = _scaleFactor2;
                          },
                          onScaleUpdate: (details) {
                            setState(() {
                              _scaleFactor2 = _baseScaleFactor2 * details.scale;
                            });
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                secondText,
                                textScaleFactor: _scaleFactor2,
                                style: TextStyle(color: dialogPickerColor, fontSize: 19),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // ColorPicker(
            //   selectedColor: selectedColor,
            //   onColorChanged: (color) {
            //     setState(() {
            //       selectedColor = color;
            //     });
            //   },
            // ),
            ListTile(
              title: Row(
                children: [
                  Text("Change Text Color", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                  SizedBox(width: 10),
                  ColorIndicator(
                    width: 30,
                    height: 30,
                    borderRadius: 4,
                    color: dialogPickerColor,
                    onSelectFocus: false,
                    onSelect: () async {
                      // Store current color before we open the dialog.
                      final Color colorBeforeDialog = dialogPickerColor;
                      // Wait for the picker to close, if dialog was dismissed,
                      // then restore the color we had before it was opened.
                      if (!(await colorPickerDialog())) {
                        setState(() {
                          dialogPickerColor = colorBeforeDialog;
                        });
                      }
                    },
                  ),
                ],
              ),
              // title: const Text('Click this color to modify it in a dialog.'),
              // subtitle: Text(
              //   // ignore: lines_longer_than_80_chars
              //   '${ColorTools.materialNameAndCode(dialogPickerColor, colorSwatchNameMap: colorsNameMap)} '
              //       'aka ${ColorTools.nameThatColor(dialogPickerColor)}',
              // ),
              // trailing:
              // ColorIndicator(
              //   width: 34,
              //   height: 34,
              //   borderRadius: 4,
              //   color: dialogPickerColor,
              //   onSelectFocus: false,
              //   onSelect: () async {
              //     // Store current color before we open the dialog.
              //     final Color colorBeforeDialog = dialogPickerColor;
              //     // Wait for the picker to close, if dialog was dismissed,
              //     // then restore the color we had before it was opened.
              //     if (!(await colorPickerDialog())) {
              //       setState(() {
              //         dialogPickerColor = colorBeforeDialog;
              //       });
              //     }
              //   },
              // ),
            ),
          ],
        ),
        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: primary,
        //   title: Text("Terms Conditions"),
        // ),
        // body: ListView(
        //   children: [
        //     termAndCondition == null ? Center(child: CircularProgressIndicator()) :Html(
        //         data:"${termAndCondition}"
        //     ),
        //   ],
        // )
      ),
    );
  }

  void _editInvitationText(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newInvitationText = invitationText;
        return AlertDialog(
          title: Text('Edit Invitation Text'),
          content: TextFormField(
            initialValue: invitationText,
            onChanged: (value) {
              newInvitationText = value;
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  invitationText = newInvitationText;
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
        String newInvitationText = firstText;
        return AlertDialog(
          title: Text('Edit Invitation Text'),
          content: TextFormField(
            initialValue: firstText,
            onChanged: (value) {
              newInvitationText = value;
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  firstText = newInvitationText;
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

  void _editInvitationText2(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newInvitationText = secondText;
        return AlertDialog(
          title: Text('Edit Invitation Text'),
          content: TextFormField(
            initialValue: secondText,
            onChanged: (value) {
              newInvitationText = value;
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  secondText = newInvitationText;
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

