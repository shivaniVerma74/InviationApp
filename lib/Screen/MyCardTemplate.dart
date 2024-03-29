import 'dart:convert';
import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctorapp/Screen/AllCards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:ui' as ui;
import '../Helper/Color.dart';
import '../New_model/AllCategoryModel.dart';
import '../New_model/GetEnquiryModel.dart';
import '../New_model/GetSliderModel.dart';
import '../New_model/GetVendorModel.dart';
import '../New_model/GetVendorModel.dart';
import '../New_model/GetVendorModel.dart';
import '../New_model/NewCategoryModel.dart';
import '../New_model/SavedCardModel.dart';
import '../New_model/TemplateForm.dart';
import '../New_model/TemplatesModel.dart';
import '../api/api_services.dart';
import '../widgets/widgets/commen_slider.dart';
import 'AllVendors.dart';
import 'CardWebview.dart';
import 'WeddingForm.dart';
import 'my_Enquiry.dart';

class MyCardTemplate extends StatefulWidget {
  const MyCardTemplate({Key? key}) : super(key: key);

  @override
  State<MyCardTemplate> createState() => _MyCardTemplateState();
}

class _MyCardTemplateState extends State<MyCardTemplate> {

  @override
  void initState() {
    super.initState();
    getSliderApi();
    getCity_id();
    //getCategory();
    allCategory();
    //getCard();
    //_getEnquiry();
  }

  GetSliderModel? _sliderModel;
  getSliderApi() async {
    var headers = {
      'Cookie': 'ci_session=ccb37a117d31b04c006884a89fbff3d1a39bffd7'
    };
    var request = http.Request('GET', Uri.parse(ApiService.getSlider));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      print("this is a response===========> $result");
      final finalResult = GetSliderModel.fromJson(json.decode(result));
      print("this is a response $finalResult");
      setState(() {
        _sliderModel = finalResult;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              _CarouselSlider1(),
              SizedBox(height: 10,),
              customTabBar(),
            ],
          ),
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

  int _currentPost = 0;
  _CarouselSlider1() {
    return CarouselSlider(
      options: CarouselOptions(
          onPageChanged: (index, result) {
            setState(() {
              _currentPost = index;
            });
          },
          viewportFraction: 1.0,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 500),
          enlargeCenterPage: false,
          scrollDirection: Axis.horizontal,
          height: 160.0),
        items: _sliderModel?.data?.map((item) {
        return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: CommonSlider(
              file: item.image ?? '',
            ));
      }).toList(),
    );
  }
  // customTabbarr() {
  //   return SingleChildScrollView(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       // mainAxisSize: MainAxisSize.min,
  //       children: [
  //         const Card(
  //           elevation: 0,
  //           child: ListTile(
  //             title: Text(
  //               "Wedding Card",
  //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
  //             ),
  //             trailing: Text(
  //               'View All',
  //               style: TextStyle(color: Colors.deepOrangeAccent),
  //             ),
  //           ),
  //         ),
  //         GridView.builder(
  //             shrinkWrap: true,
  //             physics: const NeverScrollableScrollPhysics(),
  //             itemCount: 2,
  //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //               mainAxisExtent: MediaQuery.of(context).size.height * 0.35,
  //               crossAxisCount: 2, // number of items in each row
  //               mainAxisSpacing: 20.0, // spacing between rows
  //               crossAxisSpacing: 15.0, // spacing between columns
  //             ),
  //             padding: const EdgeInsets.all(10.0),
  //             // weddingCardList?.data?.length == null
  //             //     ? 0
  //             //     : weddingCardList?.data?[0].templates!.length,
  //
  //             // scrollDirection: Axis.vertical,
  //             itemBuilder: (BuildContext context, int index) {
  //               return InkWell(
  //                 onTap: () {
  //                   Navigator.push(context, MaterialPageRoute(builder: (context) => const WeddingForm()));
  //                 },
  //                 child: Container(
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(12),
  //                     image: const DecorationImage(
  //                         image: AssetImage("assets/images/wddingimg.png"),
  //                         fit: BoxFit.fill),
  //                   ),
  //                   //    padding: EdgeInsets.all(20),
  //                   // child: Image.asset('assets/images/wddingimg.png'),
  //                   //  Image.network(
  //                   //     weddingCardList?.data?[0].templates![index].preview ??
  //                   //         ''),
  //                 ),
  //               );
  //             }),
  //         const Card(
  //           elevation: 0,
  //           child: ListTile(
  //             title: Text(
  //               "BirthDay Card",
  //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
  //             ),
  //             trailing: Text(
  //               'View All',
  //               style: TextStyle(color: Colors.deepOrangeAccent),
  //             ),
  //           ),
  //         ),
  //         GridView.builder(
  //             shrinkWrap: true,
  //             physics: const NeverScrollableScrollPhysics(),
  //             itemCount: birthDayCardList?.data == null ? 0 : birthDayCardList?.data?[0].templates!.length,
  //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //               mainAxisExtent: MediaQuery.of(context).size.height * 0.28,
  //               crossAxisCount: 2,
  //               mainAxisSpacing: 20.0,
  //               crossAxisSpacing: 15.0,
  //             ),
  //             padding: const EdgeInsets.all(10.0),
  //             // scrollDirection: Axis.vertical,
  //             itemBuilder: (BuildContext context, int index) {
  //               return InkWell(
  //                 onTap: () {
  //                   print("image hererrere ${birthDayCardList?.data?[index].templates![index].image}");
  //                   Navigator.push(
  //                     context,
  //                     MaterialPageRoute(
  //                       builder: (context) =>  Form_Screen(
  //                           image: birthDayCardList?.data?[index].templates![index].image,
  //                           temp_Id: birthDayCardList?.data?[index].templates![index].id
  //                       ),
  //                     ),
  //                   );
  //                 },
  //                 child: Container(
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(15),
  //                     image: DecorationImage(
  //                         image: NetworkImage(
  //                           birthDayCardList?.data?[0].templates![index].preview ?? '',
  //                         ),
  //                         fit: BoxFit.fill),
  //                   ),
  //                 ),
  //               );
  //             }),
  //         // newIndex == 1?
  //         // templateView2(e): templateView(),
  //         SizedBox(height: 50)
  //       ],
  //     ),
  //   );
  // }

  customTabBar() {
    print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz${vendorModelModel!.data!.length}");
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      // height: vendorModelModel!.data!.length < 4
      //     ? 150
      // //
      //
      // :  MediaQuery.of(context).size.height/2,
      // height: 150,
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(2), color: colors.whiteScaffold),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: vendorModelModel?.data?.length ?? 0,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 7.0,
                mainAxisSpacing: 7.0,
                childAspectRatio: 0.7),
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => CategoriesImagesScreen(id: vendorModelModel?.data?[index].id),
                    ),
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => BookingDetails(
                  //       model: vendorModelModel?.data?[index].temp,
                  //       ind: index,
                  //     ),
                  //   ),
                  // );
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Column(
                            children: [
                            ClipRRect(
                            child: Image.network(
                              "${vendorModelModel?.data?[index].img}",
                              fit: BoxFit.cover,
                              scale: 3,
                              // color: Colors.purple[400],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            width: 70,
                            child: Center(
                              child: Text(
                                  "${vendorModelModel?.data?[index].cName}", overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                 ),
                               ),
                          ),
                           ],
                        ),
                      ),
                    ]),
              );
            }),
      ),
    );
    // Container(
    //   height: MediaQuery.of(context).size.height / 1.2,
    //   child: GridView.builder(
    //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2,
    //         crossAxisSpacing: 5,
    //         mainAxisSpacing: 5,
    //       ),
    //       itemCount: allCategoriesModel?.data?.length ?? 0,
    //       itemBuilder: (BuildContext context, int index) {
    //         return Padding(
    //           padding: const EdgeInsets.all(0.0),
    //           child: InkWell(
    //             onTap: () {
    //               Navigator.push(
    //                 context, MaterialPageRoute(
    //                   builder: (context) => BookingDetails(
    //                     model: allCategoriesModel?.data?[index].temp,
    //                     ind: index,
    //                   ),
    //                 ),
    //               );
    //             },
    //             child: Card(
    //               shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(10)),
    //               elevation: 0,
    //               color: colors.whiteTemp,
    //               child: Column(
    //                 children: [
    //                   ClipRRect(
    //                     borderRadius: BorderRadius.circular(10),
    //                     child: Image.network(
    //                       "${allCategoriesModel?.data?[index].img}",
    //                       height: 130,
    //                       width: double.infinity,
    //                     ),
    //                   ),
    //                   const SizedBox(
    //                     height: 5,
    //                   ),
    //                   Text("${allCategoriesModel?.data?[index].cName}")
    //                 ],
    //               ),
    //             ),
    //           ),
    //         );
    //       }),
    // );
  }

  // customTabBar(){
  //   return SizedBox(
  //     child: GridView.builder(
  //       physics:const NeverScrollableScrollPhysics(),
  //         shrinkWrap: true,
  //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //           crossAxisCount: 3,
  //           mainAxisSpacing: 12,
  //           crossAxisSpacing:12,
  //           childAspectRatio: 0.65
  //         ),
  //         itemCount: allCategoriesModel?.data!.length,
  //         itemBuilder: (_,index){
  //           return Container(
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(12),
  //               boxShadow: const [
  //                  BoxShadow(
  //                   color: colors.black54,
  //                   // spreadRadius: 0.5,
  //                   blurRadius: 1,
  //                   offset: Offset(0, 1)
  //                 )
  //               ]
  //             ),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                  Image.asset("assets/home icon/Editorial.png",color: Colors.black,scale: 1.2,),
  //                 const SizedBox(height: 12,),
  //                 Text("Design",style: TextStyle(fontSize: 20,),),
  //                 const SizedBox(height: 4,),
  //               ],
  //             ),
  //           );
  //         }),
  //   );
  // }


  NewCategoryModel? weddingCardList;
  NewCategoryModel? birthDayCardList;

  VendorModel? vendorModelModel;
  allCategory() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var headers = {
      'Cookie': 'ci_session=967018c55118c57e9b50bc9d10a91f021f6744e1'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse(ApiService.categories));
    request.fields.addAll({'cat_type': '1'});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      final jsonResponse = VendorModel.fromJson(json.decode(result));
      print('categoriess responsee $jsonResponse');
      setState(() {
        vendorModelModel = jsonResponse;
        print("alll catetetetetety ${vendorModelModel?.data?.first.cName}");
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  // getCategory() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   print("Get category APiiii");
  //   var headers = {
  //     'Cookie': 'ci_session=967018c55118c57e9b50bc9d10a91f021f6744e1'
  //   };
  //   var request =
  //   http.MultipartRequest('POST', Uri.parse(ApiService.categories));
  //
  //   request.headers.addAll(headers);
  //   http.StreamedResponse response = await request.send();
  //   if (response.statusCode == 200) {
  //     var result = await response.stream.bytesToString();
  //     weddingCardList = NewCategoryModel.fromJson(jsonDecode(result));
  //     birthDayCardList = NewCategoryModel.fromJson(jsonDecode(result));
  //     if (weddingCardList!.status == true) {
  //       String? cat_id = weddingCardList!.data![0].id.toString();
  //       getCity_id();
  //       preferences.setString("cat_id", cat_id);
  //       print("Category iddd iss $cat_id");
  //     } else {
  //       // Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscriptionPlan()));
  //     }
  //     setState(() {
  //       weddingCardList!.data!.removeWhere((element) => element.cName != "Wedding Card");
  //       birthDayCardList!.data!.removeWhere((element) => element.cName != "Birthday Card");
  //     });
  //     print(weddingCardList);
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }

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
        http.MultipartRequest('POST', Uri.parse(ApiService.getservices));
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
        http.MultipartRequest('POST', Uri.parse(ApiService.savedcard));
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
        http.MultipartRequest('POST', Uri.parse(ApiService.getenquiries));
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
      print("respmoseee $getEnquiryModel");
    } else {
      print(response.reasonPhrase);
    }
  }

  myEnquiry() {
    return Column(
      children: [
        getEnquiryModel?.status == false
            ? const Text("No enquiry Found")
            : getEnquiryModel == null
                ? const Center(
                    child: CircularProgressIndicator(color: colors.secondary))
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: getEnquiryModel?.data?.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        margin: const EdgeInsets.all(10),
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
                                      borderRadius: BorderRadius.circular(10),
                                      // image: DecorationImage(image: AssetImage('assets/images/img.png'),fit: BoxFit.fill)
                                    ),
                                    height: 150,
                                    width: MediaQuery.of(context).size.width,
                                    child:
                                        // Image.asset('assets/images/img.png'),
                                        Image.network(
                                      "${ApiService.imageUrl}${getEnquiryModel?.data?[index].profileImage}",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                            padding: EdgeInsets.only(top: 25)),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.2,
                                                child: Row(
                                                  children: const [
                                                    Text("Name:",
                                                        textAlign:
                                                            TextAlign.right),
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
                                        const SizedBox(height: 7),
                                        Row(
                                          children: [
                                            Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.2,
                                                child: Row(
                                                  children: const [
                                                    Text("Mobile No:",
                                                        textAlign:
                                                            TextAlign.right),
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
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.2,
                                                child: Row(
                                                  children: const [
                                                    Text("City",
                                                        textAlign:
                                                            TextAlign.right),
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
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.2,
                                                child: Row(
                                                  children: const [
                                                    Text("Event Name:",
                                                        textAlign:
                                                            TextAlign.right),
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
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.2,
                                                child: Row(
                                                  children: const [
                                                    Text("Description:",
                                                        textAlign:
                                                            TextAlign.right),
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
    return savedCardModel?.status == false
        ? const Text("No Card Found")
        : savedCardModel?.data?.length == null ||
                savedCardModel?.data?.length == ""
            ? const Center(
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
                      "${savedCardModel?.data?[index].image}",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
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
                                  width:
                                      MediaQuery.of(context).size.width / 2.7),
                              const Text("Download",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800)),
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
