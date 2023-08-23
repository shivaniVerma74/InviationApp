import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;
import '../Helper/Color.dart';
import '../New_model/GetEnquiryModel.dart';
import '../New_model/SavedCardModel.dart';
import '../api/api_services.dart';

class MyCardTemplate extends StatefulWidget {
  const MyCardTemplate({Key? key}) : super(key: key);

  @override
  State<MyCardTemplate> createState() => _MyCardTemplateState();
}

class _MyCardTemplateState extends State<MyCardTemplate> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.white70,
      body: SingleChildScrollView(
        child:
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = 1;
                      });
                    },
                    child: Container(
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: Text(
                            'My Card',
                            style: TextStyle(
                              color: currentIndex == 1
                                  ? Color(0xffffffff)
                                  : colors.primary,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: currentIndex == 1
                                ? colors.primary
                                : Colors.transparent,
                            border: Border.all(color: colors.primary),
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => NextPage(),
                        // ));
                        currentIndex = 2;
                      });
                    },
                    child: Container(
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: Text(
                            'My Enquiry',
                            style: TextStyle(
                              color: currentIndex == 2 ?
                              Color(0xffffffff)
                                  : colors.primary,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: currentIndex == 2
                                ? colors.primary
                                : Colors.white,
                            border: Border.all(color: colors.primary),
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            currentIndex == 1 ? myCard() : myEnquiry(),
        ],
        ),
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    getCard();
    _getEnquiry();
  }

  Future<Null> refreshFunction() async{
    await getCard();
    await _getEnquiry();
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


  GetEnquiryModel? getEnquiryModel;
  _getEnquiry() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userId = preferences.getString('userId');
    print("Enquiryyyy Apiiiii");
    var headers = {
      'Cookie': 'ci_session=1db2867fc5f287b9d5f70d2589a2e26f9e99c911'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiService.getenquiries}'));
    request.fields.addAll({
      'mobile': '$userId',
    });
    print("get enquiry para ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = GetEnquiryModel.fromJson(json.decode(finalResponse));
      print("final responseeee ${finalResponse}");
      print("Get Enquiry****$jsonResponse");
      setState(() {
        getEnquiryModel = GetEnquiryModel.fromJson(json.decode(finalResponse));
      });
      print("respmoseee ${getEnquiryModel}");
    }
    else {
      print(response.reasonPhrase);
    }
  }

  myEnquiry() {
    return Column(
      children: [
        SizedBox(height: 10),
        getEnquiryModel?.status == false ? Center(child: Text("No enquiry Found"),):
        getEnquiryModel == null ? Center(
            child: CircularProgressIndicator(color: colors.primary)
        ):
        Container(
          height: MediaQuery.of(context).size.height/1.1,
          child: ListView.builder(
            // shrinkWrap: true,
              itemCount: getEnquiryModel?.data?.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return  Card(
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      height: MediaQuery.of(context).size.width/1.1,
                      width: MediaQuery.of(context).size.width/1,
                      child:Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // image: DecorationImage(image: AssetImage('assets/images/img.png'),fit: BoxFit.fill)
                              ),
                              height: 140,
                              width: MediaQuery.of(context).size.width,
                              child:
                              // Image.asset('assets/images/img.png'),
                              Image.network("${ApiService.imageUrl}${getEnquiryModel?.data?[index].profileImage}"),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(padding: EdgeInsets.only(top: 25)),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context).size.width/2.2,
                                          child: Row(
                                            children: [
                                              Text("Name:",textAlign: TextAlign.right),
                                            ],
                                          )),
                                      Container(child: Row(
                                        children: [
                                          Text("${getEnquiryModel?.data?[index].uname}"),
                                        ],
                                      )),
                                    ],
                                  ),
                                  SizedBox(height: 7),
                                  Row(
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context).size.width/2.2,

                                          child: Row(
                                            children: const [
                                              Text("Mobile no:",textAlign: TextAlign.right),
                                            ],
                                          )),
                                      Container(child: Row(
                                        children: [
                                          Text("${getEnquiryModel?.data?[index].mobile}"),
                                        ],
                                      )),
                                    ],
                                  ),
                                  SizedBox(height: 7),
                                  Row(
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context).size.width/2.2,
                                          child: Row(
                                            children: [
                                              Text("City",textAlign: TextAlign.right),
                                            ],
                                          )),
                                      Container(child: Row(
                                        children: [
                                          Text("${getEnquiryModel?.data?[index].cityName}"),
                                        ],
                                      ))
                                    ],
                                  ),
                                  SizedBox(height: 7),
                                  Row(
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context).size.width/2.2,

                                          child: Row(
                                            children: [
                                              Text("Event Name:",textAlign: TextAlign.right),
                                            ],
                                          )),
                                      Container(child: Row(
                                        children: [
                                          Text("${getEnquiryModel?.data?[index].eventName}"),
                                        ],
                                      ))
                                    ],
                                  ),
                                  SizedBox(height: 7),
                                  Row(
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context).size.width/2.2,

                                          child: Row(
                                            children: [
                                              Text("Description:",textAlign: TextAlign.right),
                                            ],
                                          )),
                                      Container(child: Row(
                                        children: [
                                          Text("${getEnquiryModel?.data?[index].description}"),
                                        ],
                                      )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
          ),
        ),
      ],
    );
  }

  myCard() {
    return savedCardModel?.status == false ? Center(child: Text("No Card Found"),):
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
      ],
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
                                  // _share(keyList);
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
                                // saveImage(keyList);
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

  // void saveImage(GlobalKey keyList) async {
  //   print("Download Functionnnnnn");
  //   ui.Image? image = await captureImage(keyList);
  //   if (image != null) {
  //     final directory = (await getApplicationDocumentsDirectory()).path;
  //     ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //     Uint8List pngBytes = byteData!.buffer.asUint8List();
  //     String fileName = DateTime.now().microsecondsSinceEpoch.toString();
  //     final file = await File('$directory/$fileName.png').create();
  //     await file.writeAsBytes(pngBytes);
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Card Download Successfully')));
  //     print('Image saved in this destination: ${file.path}');
  //   }
  // }

  // _share(GlobalKey keyList) async {
  //   var status =  await Permission.photos.request();
  //   if (/*storagePermission == PermissionStatus.granted*/ status.isGranted) {
  //     final directory = (await getApplicationDocumentsDirectory()).path;
  //     // RenderRepaintBoundary bound = keyList.c
  //     RenderRepaintBoundary bound = keyList.currentContext!.findRenderObject() as RenderRepaintBoundary;
  //     ui.Image image = await bound.toImage();
  //     ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //     print('screenhortttttttttt${byteData?.buffer.lengthInBytes}_________');
  //     // this will save image screenshot in gallery
  //     if(byteData != null){
  //       Uint8List pngBytes = byteData.buffer.asUint8List();
  //       String fileName = DateTime.now().microsecondsSinceEpoch.toString();
  //       final imagePath = await File('$directory/$fileName.png').create();
  //       await imagePath.writeAsBytes(pngBytes);
  //       Share.shareFiles([imagePath.path]);
  //     }
  //   } else if (await status.isDenied) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('This Permission is recommended')));
  //   } else if (await status.isPermanentlyDenied/*storagePermission == PermissionStatus.permanentlyDenied*/) {
  //     openAppSettings().then((value) {
  //     });
  //   }
  // }
}
