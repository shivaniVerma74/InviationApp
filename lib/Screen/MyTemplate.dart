import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:ui' as ui;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import '../Helper/Color.dart';
import '../New_model/SavedCardModel.dart';
import '../api/api_services.dart';

class MyTemplate extends StatefulWidget {
  const MyTemplate({Key? key}) : super(key: key);

  @override
  State<MyTemplate> createState() => _MyTemplateState();
}

class _MyTemplateState extends State<MyTemplate> {

  @override
  void initState() {
    super.initState();
    getCard();
  }

  Future<Null> refreshFunction()async{
    await getCard();
  }

  SavedCardModel? savedCardModel;
  getCard()async{
    print("Get carddddddd Apiiiiii");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userId = preferences.getString('userId');
    var headers = {
      'Cookie': 'ci_session=de18d172f08f4702a5883be1ed7a82cdccd37f64'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiService.savedcard}'));
    request.fields.addAll({
      'user_id': '$userId'
    });
    print("rrrrrrrrrrrrrrrrrrrrr${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = SavedCardModel.fromJson(json.decode(finalResponse));
      print("Get Enquiry****$jsonResponse");
      setState(() {
        savedCardModel = SavedCardModel.fromJson(json.decode(finalResponse));
      });
      // print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }

  // List<GlobalKey> keyList = [GlobalKey()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("My Card"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: colors.secondary,
      ),
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: refreshFunction,
          child: savedCardModel?.status == false ? Center(child: Text("No Template Found", style: TextStyle(fontSize: 15, color: Colors.black),),):
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/1.1,
                child: savedCardModel?.data?.length == null || savedCardModel?.data?.length == "" ? Center(child: CircularProgressIndicator(color: colors.primary,),):
                ListView.builder(
                  itemCount: savedCardModel?.data?.length,
                    itemBuilder: (context,i) {
                  return templateCard(i);
                }),
              ),
              // Container(
              //   height: MediaQuery.of(context).size.height/1.0,
              //   child: ListView.builder(
              //     // shrinkWrap: true,
              //       itemCount: savedCardModel!.data!.length,
              //       physics: NeverScrollableScrollPhysics(),
              //       itemBuilder: (BuildContext context, int index){
              //         return Column(
              //           children: [
              //             RepaintBoundary(
              //               key: keyList,
              //               child: Container(
              //                  height: MediaQuery.of(context).size.height/2.5,
              //                 child: Card(
              //                   child: Image.network("${savedCardModel!.data![index].image}", scale: 1),
              //                 ),
              //               ),
              //             ),
              //             // Padding(
              //             //   padding: const EdgeInsets.only(left: 5, right:5),
              //             //   child: Container(
              //             //     height: 90,
              //             //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              //             //     ),
              //             //     child: Card(
              //             //       elevation: 5,
              //             //       child: Column(children: [
              //             //         Padding(
              //             //           padding: EdgeInsets.only(left: 8, right: 8),
              //             //           child: Row(
              //             //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             //             children: [
              //             //               const Text("Price:- ",
              //             //                   style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black, decoration: TextDecoration.underline)
              //             //               ),
              //             //               Text("₹ ${savedCardModel?.data?[index].price}",
              //             //                   style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black, decoration: TextDecoration.underline)
              //             //               ),
              //             //             ],
              //             //           ),
              //             //         ),
              //             //         Padding(
              //             //           padding: const EdgeInsets.only(left: 8, top: 15),
              //             //           child: Row(
              //             //             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             //             children: [
              //             //               const Text("Share",
              //             //                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              //             //               ),
              //             //               const SizedBox(width: 5),
              //             //               Container(
              //             //                 height: 45,
              //             //                 width: 45,
              //             //                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colors.primary),
              //             //                 child: IconButton(
              //             //                     onPressed: () {
              //             //                       // setState(() {
              //             //                       // });
              //             //                       _share();
              //             //                     },
              //             //                     icon: const Icon(Icons.share, color: Colors.white)),
              //             //               ),
              //             //               SizedBox(width: MediaQuery.of(context).size.width/2.9),
              //             //               Text("Download", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
              //             //               SizedBox(width: 5),
              //             //               Container(
              //             //                 height: 45,
              //             //                 width: 45,
              //             //                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colors.primary),
              //             //                 child: IconButton(
              //             //                   onPressed:() async {
              //             //                     saveImage();
              //             //                     // downloadFile();
              //             //                   },
              //             //                   icon: const Icon(Icons.download, color: Colors.white),
              //             //                 ),
              //             //               ),
              //             //             ],
              //             //           ),
              //             //         ),
              //             //       ],)
              //             //     ),
              //             //   ),
              //             // ),
              //           ],
              //         );
              //       }
              //   ),
              // ),
              // savedCardModel == null ? Center(
              //     child: CircularProgressIndicator(color: colors.primary)
              // ):
            ],
          ),
        ),
      ),
    );
  }

  templateCard(int index){
    GlobalKey keyList = GlobalKey();
   return  Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            RepaintBoundary(
                key: keyList,
                child: Container(
                    child: Image.network("${savedCardModel?.data?[index].image}",height: 280,width: 490))),
            Container(
              height: 90,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              ),
              child: Card(
                elevation: 0,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Price:- ",
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black, decoration: TextDecoration.underline)
                          ),
                          Text("₹ ${savedCardModel?.data?[index].price}",
                              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black, decoration: TextDecoration.underline)
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 15),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Share",
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colors.primary),
                            child: IconButton(
                                onPressed: () {
                                  // setState(() {
                                  // });
                                  _share(keyList);
                                },
                                icon: const Icon(Icons.share, color: Colors.white)),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width/2.7),
                          const Text("Download", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800)),
                          SizedBox(width: 5),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colors.primary),
                            child: IconButton(
                              onPressed:() async {
                                saveImage(keyList);
                                // downloadFile();
                              },
                              icon: const Icon(Icons.download, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<ui.Image?> captureImage(GlobalKey keyList) async {
    try {
      RenderRepaintBoundary boundary = keyList.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      return image;
    } catch (exception) {
      print(exception);
      return null;
    }
  }

  void saveImage(GlobalKey keyList) async {
    print("Download Functionnnnnn");
    ui.Image? image = await captureImage(keyList);
    if (image != null) {
      final directory = (await getApplicationDocumentsDirectory()).path;
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      String fileName = DateTime.now().microsecondsSinceEpoch.toString();
      final file = await File('$directory/$fileName.png').create();
      await file.writeAsBytes(pngBytes);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Card Download Successfully')));
      print('Image saved in this destination: ${file.path}');
    }
  }

  _share(GlobalKey keyList) async {
    var status =  await Permission.photos.request();
    if (/*storagePermission == PermissionStatus.granted*/ status.isGranted) {
      final directory = (await getApplicationDocumentsDirectory()).path;
      // RenderRepaintBoundary bound = keyList.c
      RenderRepaintBoundary bound = keyList.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await bound.toImage();
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      print('screenhortttttttttt${byteData?.buffer.lengthInBytes}_________');
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
}
