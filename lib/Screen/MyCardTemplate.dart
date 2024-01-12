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
import '../New_model/AllCategoryModel.dart';
import '../New_model/GetEnquiryModel.dart';
import '../New_model/NewCategoryModel.dart';
import '../New_model/SavedCardModel.dart';
import '../New_model/TemplateForm.dart';
import '../New_model/TemplatesModel.dart';
import '../api/api_services.dart';
import 'WeddingForm.dart';

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
        child: Column(
          children: [
            customTabbarr(),
          ],
        ),
        // Column(
        //   children: [
        //     // Row(
        //     //   children: [
        //     //     Padding(
        //     //       padding: const EdgeInsets.only(top: 20, left: 20),
        //     //       child: InkWell(
        //     //         onTap: () {
        //     //           setState(() {
        //     //             currentIndex = 1;
        //     //           });
        //     //         },
        //     //         child: Container(
        //     //             height: 40,
        //     //             child: Padding(
        //     //               padding: const EdgeInsets.only(
        //     //                   top: 10, left: 10, right: 10),
        //     //               child: Text(
        //     //                 'My Card',
        //     //                 style: TextStyle(
        //     //                   color: currentIndex == 1
        //     //                       ? Color(0xffffffff)
        //     //                       : colors.primary,
        //     //                   fontSize: 16,
        //     //                 ),
        //     //               ),
        //     //             ),
        //     //             decoration: BoxDecoration(
        //     //                 color: currentIndex == 1
        //     //                     ? colors.primary
        //     //                     : Colors.transparent,
        //     //                 border: Border.all(color: colors.primary),
        //     //                 borderRadius: BorderRadius.circular(5))),
        //     //       ),
        //     //     ),
        //     //     const SizedBox(
        //     //       width: 10,
        //     //     ),
        //     //     Padding(
        //     //       padding: const EdgeInsets.only(top: 20),
        //     //       child: InkWell(
        //     //         onTap: () {
        //     //           setState(() {
        //     //             // Navigator.of(context).push(MaterialPageRoute(
        //     //             //   builder: (context) => NextPage(),
        //     //             // ));
        //     //             currentIndex = 2;
        //     //           });
        //     //         },
        //     //         child: Container(
        //     //             height: 40,
        //     //             child: Padding(
        //     //               padding: const EdgeInsets.only(
        //     //                   top: 10, left: 10, right: 10),
        //     //               child: Text(
        //     //                 'My Enquiry',
        //     //                 style: TextStyle(
        //     //                   color: currentIndex == 2
        //     //                       ? Color(0xffffffff)
        //     //                       : colors.primary,
        //     //                   fontSize: 16,
        //     //                 ),
        //     //               ),
        //     //             ),
        //     //             decoration: BoxDecoration(
        //     //                 color: currentIndex == 2
        //     //                     ? colors.primary
        //     //                     : Colors.white,
        //     //                 border: Border.all(color: colors.primary),
        //     //                 borderRadius: BorderRadius.circular(5))),
        //     //       ),
        //     //     ),
        //     //   ],
        //     // ),
        //     Row(
        //       children: [
        //         InkWell(
        //           onTap: () {
        //             setState(() {
        //               // Navigator.of(context).push(MaterialPageRoute(
        //               //   builder: (context) => NextPage(),
        //               // ));
        //               currentIndex = 1;
        //             });
        //           },
        //           child: Container(
        //             height: 50,
        //             width: MediaQuery.of(context).size.width / 2,
        //             decoration: BoxDecoration(
        //                 // color: currentIndex == 2
        //                 //     ? colors.primary
        //                 //     : Colors.white,
        //                 // border: Border.all(color: colors.primary),
        //                 borderRadius: BorderRadius.circular(5)),
        //             child: Padding(
        //               padding:
        //                   const EdgeInsets.only(top: 1, left: 30, right: 10),
        //               child: Column(
        //                 children: [
        //                   // Image.asset(
        //                   //   "assets/images/tent.png",
        //                   //   height: 40,
        //                   //   width: 40,
        //                   // ),
        //                   const SizedBox(height: 10),
        //                   Text(
        //                     'My Card',
        //                     style: TextStyle(
        //                       color: currentIndex == 3
        //                           ? colors.secondary
        //                           : colors.blackTemp,
        //                       fontSize: 18,
        //                     ),
        //                   ),
        //                   Divider(
        //                     thickness: 4,
        //                     color: currentIndex == 1
        //                         ? colors.secondary
        //                         : Colors.white.withOpacity(0),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ),
        //         InkWell(
        //           onTap: () {
        //             setState(() {
        //               // Navigator.of(context).push(MaterialPageRoute(
        //               //   builder: (context) => NextPage(),
        //               // ));
        //               currentIndex = 2;
        //             });
        //           },
        //           child: Container(
        //             height: 50,
        //             width: MediaQuery.of(context).size.width / 2,
        //             decoration: BoxDecoration(
        //                 // color: currentIndex == 2
        //                 //     ? colors.primary
        //                 //     : Colors.white,
        //                 // border: Border.all(color: colors.primary),
        //                 borderRadius: BorderRadius.circular(5)),
        //             child: Padding(
        //               padding:
        //                   const EdgeInsets.only(top: 1, left: 30, right: 10),
        //               child: Column(
        //                 children: [
        //                   // Image.asset(
        //                   //   "assets/images/tent.png",
        //                   //   height: 40,
        //                   //   width: 40,
        //                   // ),
        //                   const SizedBox(height: 10),
        //                   Text(
        //                     'My Enquiry',
        //                     style: TextStyle(
        //                       color: currentIndex == 2
        //                           ? colors.secondary
        //                           : colors.blackTemp,
        //                       fontSize: 18,
        //                     ),
        //                   ),
        //                   Divider(
        //                     thickness: 4,
        //                     color: currentIndex == 2
        //                         ? colors.secondary
        //                         : Colors.white.withOpacity(0),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //     const SizedBox(
        //       height: 10,
        //     ),
        //     currentIndex == 1 ? myCard() : myEnquiry(),
        //   ],
        // ),
      ),
    );
  }


  customTabbarr() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          const Card(
            elevation: 0,
            child: ListTile(
              title: Text(
                "Wedding Card",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              trailing: Text(
                'View All',
                style: TextStyle(color: Colors.deepOrangeAccent),
              ),
            ),
          ),
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: MediaQuery.of(context).size.height * 0.35,
                crossAxisCount: 2, // number of items in each row
                mainAxisSpacing: 20.0, // spacing between rows
                crossAxisSpacing: 15.0, // spacing between columns
              ),
              padding: const EdgeInsets.all(10.0),
              // weddingCardList?.data?.length == null
              //     ? 0
              //     : weddingCardList?.data?[0].templates!.length,

              // scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const WeddingForm()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                          image: AssetImage("assets/images/wddingimg.png"),
                          fit: BoxFit.fill),
                    ),
                    //    padding: EdgeInsets.all(20),
                    // child: Image.asset('assets/images/wddingimg.png'),
                    //  Image.network(
                    //     weddingCardList?.data?[0].templates![index].preview ??
                    //         ''),
                  ),
                );
              }),
          const Card(
            elevation: 0,
            child: ListTile(
              title: Text(
                "BirthDay Card",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              trailing: Text(
                'View All',
                style: TextStyle(color: Colors.deepOrangeAccent),
              ),
            ),
          ),
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: birthDayCardList?.data == null ? 0 : birthDayCardList?.data?[0].templates!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: MediaQuery.of(context).size.height * 0.28,
                crossAxisCount: 2,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 15.0,
              ),
              padding: const EdgeInsets.all(10.0),
              // scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    print("image hererrere ${birthDayCardList?.data?[index].templates![index].image}");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  Form_Screen(
                            image: birthDayCardList?.data?[index].templates![index].image,
                            temp_Id: birthDayCardList?.data?[index].templates![index].id
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: NetworkImage(
                            birthDayCardList?.data?[0].templates![index].preview ?? '',
                          ),
                          fit: BoxFit.fill),
                    ),
                  ),
                );
              }),
          // newIndex == 1?
          // templateView2(e): templateView(),
          SizedBox(height: 50)
        ],
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    getCity_id();
    getCategory();
    // getCard();
    // _getEnquiry();
  }

  NewCategoryModel? weddingCardList;
  NewCategoryModel? birthDayCardList;
  AllCategoryModel? allCategoriesModel;

  getCategory() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("Get category APiiii");
    var headers = {
      'Cookie': 'ci_session=967018c55118c57e9b50bc9d10a91f021f6744e1'
    };
    var request =
    http.MultipartRequest('POST', Uri.parse(ApiService.categories));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      weddingCardList = NewCategoryModel.fromJson(jsonDecode(result));
      birthDayCardList = NewCategoryModel.fromJson(jsonDecode(result));
      if (weddingCardList!.status == true) {
        String? cat_id = weddingCardList!.data![0].id.toString();
        getCity_id();
        preferences.setString("cat_id", cat_id);
        print("Category iddd iss $cat_id");
      } else {
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscriptionPlan()));
      }
      setState(() {
        weddingCardList!.data!.removeWhere((element) => element.cName != "Wedding Card");
        birthDayCardList!.data!.removeWhere((element) => element.cName != "Birthday Card");
      });
      print(weddingCardList);
    } else {
      print(response.reasonPhrase);
    }
  }

  String? cityID;
  getCity_id() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    cityID = preferences.getString('citi');
    print("citiee in homeee pageee $cityID");
  }


  TemplatesModel? templatesModel;
  getTemplate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("Get Template Apiiii");
    var headers = {
      'Cookie': 'ci_session=a36a8335f024c7b97f4162931f63227153359896'
    };
    var request =
    http.MultipartRequest('POST', Uri.parse('${ApiService.getservices}'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      final jsonResponse = TemplatesModel.fromJson(json.decode(result));
      String? template_id = jsonResponse.data?.first.id ?? "";
      preferences.setString("template_id", template_id);
      print("Temaplteeee Idddd in home pagee $template_id");
      if (jsonResponse.responseCode == "1") {}
      print('Templateee Apiii Responsee______$jsonResponse');
      setState(() {
        templatesModel = jsonResponse;
      });
      // templateView();
    } else {
      print(response.reasonPhrase);
    }
  }



  Future<Null> refreshFunction() async {
    await getCard();
    await _getEnquiry();
  }

  SavedCardModel? savedCardModel;
  getCard() async {
    print("Get carddddddd Apiiiiii");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userId = preferences.getString('userId');
    var headers = {
      'Cookie': 'ci_session=de18d172f08f4702a5883be1ed7a82cdccd37f64'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse('${ApiService.savedcard}'));
    request.fields.addAll({'user_id': '$userId'});
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
    } else {
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
    var request =
        http.MultipartRequest('POST', Uri.parse('${ApiService.getenquiries}'));
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
    } else {
      print(response.reasonPhrase);
    }
  }

  myEnquiry() {
    return Column(
      children: [
        getEnquiryModel?.status == false
            ? Text("No enquiry Found")
            : getEnquiryModel == null
                ? Center(
                    child: CircularProgressIndicator(color: colors.secondary))
                : ListView.builder(
                     shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: getEnquiryModel?.data?.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        margin: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            height: MediaQuery.of(context).size.width / 1.1,
                            width: MediaQuery.of(context).size.width / 1,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10),
                                      // image: DecorationImage(image: AssetImage('assets/images/img.png'),fit: BoxFit.fill)
                                    ),
                                    height: 150,
                                    width:
                                        MediaQuery.of(context).size.width,
                                    child:
                                        // Image.asset('assets/images/img.png'),
                                        Image.network(
                                            "${ApiService.imageUrl}${getEnquiryModel?.data?[index].profileImage}", fit: BoxFit.fill,),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding:
                                                EdgeInsets.only(top: 25)),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                width:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2.2,
                                                child: Row(
                                                  children: [
                                                    Text("Name:",
                                                        textAlign: TextAlign
                                                            .right),
                                                  ],
                                                )),
                                            Container(
                                                child: Row(
                                              children: [
                                                Text(
                                                    "${getEnquiryModel?.data?[index].uname}"),
                                              ],
                                            )),
                                          ],
                                        ),
                                        SizedBox(height: 7),
                                        Row(
                                          children: [
                                            Container(
                                                width:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2.2,
                                                child: Row(
                                                  children: const [
                                                    Text("Mobile No:",
                                                        textAlign: TextAlign
                                                            .right),
                                                  ],
                                                )),
                                            Container(
                                                child: Row(
                                              children: [
                                                Text(
                                                    "${getEnquiryModel?.data?[index].mobile}"),
                                              ],
                                            )),
                                          ],
                                        ),
                                        SizedBox(height: 7),
                                        Row(
                                          children: [
                                            Container(
                                                width:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2.2,
                                                child: Row(
                                                  children: [
                                                    Text("City",
                                                        textAlign: TextAlign
                                                            .right),
                                                  ],
                                                )),
                                            Container(
                                                child: Row(
                                              children: [
                                                Text(
                                                    "${getEnquiryModel?.data?[index].cityName}"),
                                              ],
                                            ))
                                          ],
                                        ),
                                        SizedBox(height: 7),
                                        Row(
                                          children: [
                                            Container(
                                                width:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2.2,
                                                child: Row(
                                                  children: [
                                                    Text("Event Name:",
                                                        textAlign: TextAlign
                                                            .right),
                                                  ],
                                                )),
                                            Container(
                                                child: Row(
                                              children: [
                                                Text(
                                                    "${getEnquiryModel?.data?[index].eventName}"),
                                              ],
                                            ))
                                          ],
                                        ),
                                        SizedBox(height: 7),
                                        Row(
                                          children: [
                                            Container(
                                                width:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2.2,
                                                child: Row(
                                                  children: [
                                                    Text("Description:",
                                                        textAlign: TextAlign
                                                            .right),
                                                  ],
                                                )),
                                            Container(
                                                child: Row(
                                              children: [
                                                Text(
                                                    "${getEnquiryModel?.data?[index].description}"),
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
                    }),
      ],
    );
  }

  myCard() {
    return savedCardModel?.status == false ? Text("No Card Found")
        : savedCardModel?.data?.length == null ||
                savedCardModel?.data?.length == ""
            ? Center(
                child: CircularProgressIndicator(
                  color: colors.secondary,
                ),
              )
            : ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
                itemCount: savedCardModel?.data?.length,
                itemBuilder: (context, i) {
                  return templateCard(i);
                });
  }

  templateCard(int index) {
    GlobalKey keyList = GlobalKey();
    return Column(
      children: [
        Card(
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                RepaintBoundary(
                    key: keyList,
                    child: Container(
                        child: Image.network(
                            "${savedCardModel?.data?[index].image}", fit: BoxFit.fill,
                            ),),),
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline)),
                              Text("₹ ${savedCardModel?.data?[index].price}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, top: 15),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Share",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(width: 5),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: colors.secondary),
                                child: IconButton(
                                    onPressed: () {
                                      // setState(() {
                                      // });
                                      // _share(keyList);
                                    },
                                    icon: const Icon(Icons.share,
                                        color: Colors.white)),
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width / 2.7),
                              const Text("Download",
                                  style: TextStyle(
                                      fontSize: 12, fontWeight: FontWeight.w800)),
                              SizedBox(width: 5),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: colors.secondary),
                                child: IconButton(
                                  onPressed: () async {
                                    // saveImage(keyList);
                                    // downloadFile();
                                  },
                                  icon: const Icon(Icons.download,
                                      color: Colors.white),
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
        ),

      ],
    );
  }

  Future<ui.Image?> captureImage(GlobalKey keyList) async {
    try {
      RenderRepaintBoundary boundary =
          keyList.currentContext!.findRenderObject() as RenderRepaintBoundary;
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