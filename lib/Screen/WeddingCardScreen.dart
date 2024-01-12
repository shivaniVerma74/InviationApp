import 'dart:typed_data';

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import '../Helper/Color.dart';
import 'WeddingCardView.dart';

// import '../Helper/Color.dart';

class WeddingCardScreen extends StatefulWidget {
  final String? groomName;
  String? groomFatherName;
  String? groomMotherName;
  final String? brideName;
  String? brideFatherName;
  String? brideMotherName;
  String? programName;
  String? venueName;
  String? Date;
  String? Time;
  String? secondPrograme;
  String? secondVenue;
  String? secondDate;
  String? secondTime;
  String? thirdPrograme;
  String? thirdVenue;
  String? thirdDate;
  String? thirdTime;

  WeddingCardScreen({Key? key, this.groomName, this.groomFatherName, this.groomMotherName, this.brideName, this.brideFatherName, this.brideMotherName,this.programName,
    this.venueName, this.Date, this.Time, this.secondPrograme, this.secondVenue, this.secondDate,
    this.secondTime, this.thirdPrograme, this.thirdTime, this.thirdVenue, this.thirdDate}) : super(key: key);
  @override
  State<WeddingCardScreen> createState() => _WeddingCardScreenState();
}
// Things we want to navigate to another page

class _WeddingCardScreenState extends State<WeddingCardScreen> {
  final GlobalKey ssKey = GlobalKey();
  final GlobalKey ssKey2 = GlobalKey();
  final GlobalKey ssKey3 = GlobalKey();

  Uint8List? imageData;
  Uint8List? imageData2;
  Uint8List? imageData3;
  List<Uint8List> imageList = [];


  late Color screenPickerColor;
  late Color dialogPickerColor;
  late Color dialogPickerColor1;
  late Color dialogSelectColor;


  @override
  void initState() {
    screenPickerColor = Colors.blue;
    dialogPickerColor = Colors.black;
    dialogSelectColor = const Color(0xFFA239CA);
    super.initState();
  }
  //File imageFile=

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.secondary,
        centerTitle: true,
        title: const Text("Wedding Card"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            children: [
              RepaintBoundary(
                key: ssKey2,
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/wedding.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 230, top: 140),
                          child: Text("${widget.brideName}",
                              style:  TextStyle(
                                  color: dialogPickerColor,
                                  fontSize: 15,
                                  fontFamily: 'Granaina')
                          ),
                        ),
                        // const SizedBox(height: 10),
                        //  Text("Weds",
                        //     style: TextStyle(
                        //         color: dialogPickerColor,
                        //         fontSize: 18,
                        //         fontFamily: 'Granaina')),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(left: 150, bottom: 20),
                          child: Text("${widget.groomName}",
                              style:  TextStyle(
                                  color: dialogPickerColor,
                                  fontSize: 15,
                                  fontFamily: 'Granaina'),
                          ),
                        ),
                        const SizedBox(
                          height: 120,
                        ),
                         // Text("Wedding Invitation",
                         //    style: TextStyle(
                         //        color: dialogPickerColor,
                         //        fontSize: 22,
                         //        fontFamily: 'Granaina'),
                         // ),
                         Padding(
                           padding: const EdgeInsets.only(top: 20),
                           child: Text("${widget.Date}",
                              style: TextStyle(
                                  color: dialogPickerColor,
                                  fontSize: 18,
                                  fontFamily: 'Granaina'),
                           ),
                         ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              RepaintBoundary(
                key: ssKey3,
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/weddingtwo.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 110),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(top: 190,left: 100),
                            child: Text("${widget.groomName}",style:  TextStyle(
                                color: dialogPickerColor,
                                fontSize: 15,
                                fontFamily: 'Granaina')),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40,right: 50),
                            child: Text("${widget.brideName}",style:  TextStyle(
                                color: dialogPickerColor,
                                fontSize: 15,
                                fontFamily: 'Granaina')),
                          ),
                        ],
                      ),
                    ),
                      SizedBox(height: 100,),

                      Padding(
                        padding: const EdgeInsets.only(top: 50,right: 16,left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${widget.Date}",style:  TextStyle(
                                color: dialogPickerColor,
                                fontSize: 15,
                                fontFamily: 'Granaina')),
                            Text("${widget.secondDate}",style:  TextStyle(
                                color: dialogPickerColor,
                                fontSize: 15,
                                fontFamily: 'Granaina')),
                            Text("${widget.thirdDate}",style:  TextStyle(
                                color: dialogPickerColor,
                                fontSize: 15,
                                fontFamily: 'Granaina')),
                          ],
                        )
                      ),
                      //  Text(
                      //     "We expected to bless us during the holy wedding of love,",
                      //     style: TextStyle(
                      //         color: dialogPickerColor,
                      //         fontSize: 11,
                      //         fontFamily: 'Granaina')),
                      //  Text(
                      //     "Devotion and family. You are invited with all the members of",
                      //     style: TextStyle(
                      //         color: dialogPickerColor,
                      //         fontSize: 11,
                      //         fontFamily: 'Granaina')),
                      //  Text("your family.",
                      //     style: TextStyle(
                      //         color: dialogPickerColor,
                      //         fontSize: 11,
                      //         fontFamily: 'Granaina')),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // Text("${widget.brideName}",
                      //     style:  TextStyle(
                      //         color: dialogPickerColor,
                      //         fontSize: 22,
                      //         fontFamily: 'Granaina')),
                      //  Text("Daughter of",
                      //     style: TextStyle(
                      //         color: dialogPickerColor,
                      //         fontSize: 11,
                      //         fontFamily: 'Granaina')),
                      // Text(
                      //     "${widget.brideFatherName} & ${widget.brideMotherName}",
                      //     style:  TextStyle(
                      //         color: dialogPickerColor,
                      //         fontSize: 18,
                      //         fontFamily: 'Granaina')),
                      // const SizedBox(
                      //   height: 30,
                      // ),
                      //  Text("With",
                      //     style: TextStyle(
                      //         color: dialogPickerColor,
                      //         fontSize: 15,
                      //         fontFamily: 'Granaina')),
                      // const SizedBox(
                      //   height: 30,
                      // ),
                      // Text("${widget.groomName}",
                      //     style:  TextStyle(
                      //         color: dialogPickerColor,
                      //         fontSize: 22,
                      //         fontFamily: 'Granaina')),
                      //  Text("Son of",
                      //     style: TextStyle(
                      //         color: dialogPickerColor,
                      //         fontSize: 11,
                      //         fontFamily: 'Granaina')),
                      // Text(
                      //     "${widget.brideFatherName} & ${widget.brideMotherName}",
                      //     style:  TextStyle(
                      //         color: dialogPickerColor,
                      //         fontSize: 18,
                      //         fontFamily: 'Granaina')),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      //  Text("Together with their family and friends",
                      //     style: TextStyle(
                      //         color: dialogPickerColor,
                      //         fontSize: 15,
                      //         fontFamily: 'Granaina')),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>WeddingCardScreen2()));
                },
                child: RepaintBoundary(
                  key: ssKey,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/weddingthree.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 140,left: 20,right: 20),
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${widget.groomName}",style:  TextStyle(
                                  color: dialogPickerColor,
                                  fontSize: 30,
                                  fontFamily: 'Granaina')),
                              Text("${widget.brideName}",style:  TextStyle(
                                  color: dialogPickerColor,
                                  fontSize: 30,
                                  fontFamily: 'Granaina')),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("S/o MR. ${widget.groomFatherName}",style:  TextStyle(
                                     color: dialogPickerColor,
                                     fontSize: 15,
                                     fontFamily: 'Granaina')),
                                 Text("MRS. ${widget.brideName}",style:  TextStyle(
                                     color: dialogPickerColor,
                                     fontSize: 15,
                                     fontFamily: 'Granaina')),

                               ],
                             ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text("S/o MR. ${widget.brideFatherName}",style:  TextStyle(
                                      color: dialogPickerColor,
                                      fontSize: 15,
                                      fontFamily: 'Granaina')),
                                  Text("MRS. ${widget.brideMotherName}",style:  TextStyle(
                                      color: dialogPickerColor,
                                      fontSize: 15,
                                      fontFamily: 'Granaina')),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 50,),
                        Center(child: Text("FAMILY MEMBER", style:  TextStyle(
                            color: dialogPickerColor,
                            fontSize: 20,
                            fontFamily: 'Granaina'))),
                       SizedBox(height: 5),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text("${widget.brideFatherName},", style:  TextStyle(
                               color: dialogPickerColor,
                               fontSize: 15,
                               fontFamily: 'Granaina')),
                           SizedBox(width: 2,),
                           Text("${widget.brideMotherName},",style:  TextStyle(
                               color: dialogPickerColor,
                               fontSize: 15,
                               fontFamily: 'Granaina')),
                           SizedBox(width: 2),
                           Text("${widget.brideMotherName},", style:  TextStyle(
                               color: dialogPickerColor,
                               fontSize: 15,
                               fontFamily: 'Granaina')),
                           const SizedBox(width: 2,),
                           Text("${widget.brideMotherName},", style:  TextStyle(
                               color: dialogPickerColor,
                               fontSize: 15,
                               fontFamily: 'Granaina')),
                           const SizedBox(width: 2),
                           Text("${widget.brideMotherName},", style:  TextStyle(
                               color: dialogPickerColor,
                               fontSize: 15,
                               fontFamily: 'Granaina')),
                           SizedBox(width: 2),
                           Text("${widget.brideFatherName},", style:  TextStyle(
                               color: dialogPickerColor,
                               fontSize: 15,
                               fontFamily: 'Granaina')),
                         ],
                       ),
                        SizedBox(height: 20,),
                        Center(child: Text("VENUE DETAILS", style:  TextStyle(
                            color: dialogPickerColor,
                            fontSize: 20,
                            fontFamily: 'Granaina'))),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${widget.secondVenue}", style:  TextStyle(
                                color: dialogPickerColor,
                                fontSize: 17,
                                fontFamily: 'Granaina')),
                            SizedBox(width: 5,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Text("${widget.programName}",
              //     style: TextStyle(
              //         color: dialogPickerColor,
              //         fontSize: 22,
              //         fontFamily: 'Granaina')),
              // const SizedBox(
              //   height: 5,
              // ),
              // Text("${widget.Date} ${widget.Time}",
              //     style:  TextStyle(
              //         color: dialogPickerColor,
              //         fontSize: 14,
              //         fontFamily: 'Granaina')),
              // const SizedBox(
              //   height: 5,
              // ),
              // Text("${widget.venueName}",
              //   style:  TextStyle(
              //       color: dialogPickerColor,
              //       fontSize: 14,
              //       fontFamily: 'Granaina'),
              // ),
              // const SizedBox(
              //   height: 25,
              // ),
              // Text("${widget.secondPrograme}",
              //     style:  TextStyle(
              //         color: dialogPickerColor,
              //         fontSize: 20,
              //         fontFamily: 'Granaina')),
              // Text("${widget.Date} ${widget.secondTime}",
              //     style:  TextStyle(
              //         color: dialogPickerColor,
              //         fontSize: 14,
              //         fontFamily: 'Granaina')),
              // const SizedBox(
              //   height: 5,
              // ),
              // Text("${widget.secondVenue}",
              //     style:  TextStyle(
              //         color: dialogPickerColor,
              //         fontSize: 14,
              //         fontFamily: 'Granaina')),
              // const SizedBox(
              //   height: 25,
              // ),
              // Text("${widget.thirdPrograme}",
              //     style:  TextStyle(
              //         color: dialogPickerColor,
              //         fontSize: 22,
              //         fontFamily: 'Granaina')),
              // Text("${widget.Date} ${widget.thirdTime}",
              //     style:  TextStyle(
              //         color: dialogPickerColor,
              //         fontSize: 14,
              //         fontFamily: 'Granaina')),
              // const SizedBox(
              //   height: 5,
              // ),
              // Text("${widget.thirdVenue}",
              //     style:  TextStyle(
              //         color: dialogPickerColor,
              //         fontSize: 14,
              //         fontFamily: 'Granaina')),
              // ElevatedButton(onPressed: ()async{
              //   RenderRepaintBoundary boundary=ssKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
              //   ui.Image image= await boundary.toImage(pixelRatio: 1.0);
              //   ByteData? byte=await image.toByteData(format: ui.ImageByteFormat.png);
              //   setState(() {
              //     imageData=byte!.buffer.asUint8List();
              //   });
              //
              // }, child: Text("Take Screenshot")),
              Row(
                children: [
                  // const Text("Change Text Color", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  // const SizedBox(width: 4),
                  // ColorIndicator(
                  //   width: 30,
                  //   height: 30,
                  //   borderRadius: 4,
                  //   color: dialogPickerColor,
                  //   onSelectFocus: false,
                  //   onSelect: () async {
                  //     final Color colorBeforeDialog = dialogPickerColor;
                  //     if (!(await colorPickerDialog())) {
                  //       setState(() {
                  //         dialogPickerColor = colorBeforeDialog;
                  //       });
                  //     }
                  //   },
                  // ),
                  const SizedBox(width: 70),
                  Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: colors.secondary),
                          onPressed: () async {
                            //For 1st Image
                            RenderRepaintBoundary boundary2 = ssKey2.currentContext!
                                .findRenderObject() as RenderRepaintBoundary;
                            ui.Image image2 = await boundary2.toImage(pixelRatio: 3.0);
                            ByteData? byte2 = await image2.toByteData(format: ui.ImageByteFormat.png);
                            setState(() {
                              imageData2 = byte2!.buffer.asUint8List();
                            });
                            //For 2ND Image
                            RenderRepaintBoundary boundary3 = ssKey3.currentContext!
                                .findRenderObject() as RenderRepaintBoundary;
                            ui.Image image3 = await boundary3.toImage(pixelRatio: 3.0);
                            ByteData? byte3 =
                            await image3.toByteData(format: ui.ImageByteFormat.png);
                            setState(() {
                              imageData3 = byte3!.buffer.asUint8List();
                            });
                            //For 3rd Image
                            RenderRepaintBoundary boundary = ssKey.currentContext!
                                .findRenderObject() as RenderRepaintBoundary;
                            ui.Image image = await boundary.toImage(pixelRatio: 3.0);
                            ByteData? byte =
                            await image.toByteData(format: ui.ImageByteFormat.png);
                            setState(() {
                              imageData = byte!.buffer.asUint8List();
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WeddingCardView(image: imageData!, image2: imageData2!,image3: imageData3!)));
                          },
                          child: const Text("Save Card")),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


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
