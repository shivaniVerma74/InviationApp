// import 'dart:convert';
//
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:doctorapp/AuthenticationView/LoginScreen.dart';
// import 'package:doctorapp/Booking/booking_screen.dart';
// import 'package:doctorapp/Brand/BrandScreen.dart';
// import 'package:doctorapp/Helper/Color.dart';
// import 'package:doctorapp/Screen/Histroy.dart';
// import 'package:doctorapp/Static/privacy_Policy.dart';
// import 'package:doctorapp/api/api_services.dart';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../Awreness/Awareness_Inputs_screen.dart';
// import '../Editorial/editorial.dart';
// import '../Event/event_and_webiner.dart';
// import '../New_model/Check_plan_model.dart';
// import '../New_model/GetCountingModel.dart';
// import '../New_model/GetSelectCatModel.dart';
// import '../New_model/GetSliderModel.dart';
// import '../New_model/GetcategoryModel.dart';
// import '../New_model/getUserProfileModel.dart';
// import '../Profile/Update_password.dart';
// import '../Profile/profile_screen.dart';
// import '../Service/serviceScreen.dart';
// import '../SubscriptionPlan/addPosterScreen.dart';
// import '../SubscriptionPlan/subscription_plan.dart';
// import '../widgets/widgets/commen_slider.dart';
// import '../Product/Pharma_product_screen.dart';
// import 'TemplateScreen.dart';
// import 'WishlistScreen.dart';
//
// import '../Static/terms_condition.dart';
// import '../News/update_screen.dart';
// import 'filte_speciality.dart';
//
// class HomeScreen extends StatefulWidget {
//   final bool? speciality;
//   const HomeScreen({
//     Key? key, this.speciality
//   }) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final GlobalKey<ScaffoldState> _key = GlobalKey();
//   SpeciplyData? localFilter;
//   int currentindex = 0;
//
//   // GetUserProfileModel? getprofile;
//   // getuserProfile() async {
//   //   SharedPreferences preferences = await SharedPreferences.getInstance();
//   //   String? userId = preferences.getString('userId');
//   //   print("getProfile--------------->${userId}");
//   //   var headers = {
//   //     'Cookie': 'ci_session=d9075fff59f39b7a82c03ca267be8899c1a9fbf8'
//   //   };
//   //   var request = http.MultipartRequest(
//   //       'POST', Uri.parse('${ApiService.getUserProfile}'));
//   //   request.fields.addAll({'user_id': '$userId'});
//   //   print("getProfile--------------->${request.fields}");
//   //   request.headers.addAll(headers);
//   //
//   //   http.StreamedResponse response = await request.send();
//   //
//   //   if (response.statusCode == 200) {
//   //     var finalResult = await response.stream.bytesToString();
//   //     final jsonResponse =
//   //         GetUserProfileModel.fromJson(json.decode(finalResult));
//   //     print("this is a ========>profile${jsonResponse}");
//   //     print("emailllllll${getprofile?.user?.mobile}");
//   //     setState(() {
//   //       getprofile = jsonResponse;
//   //     });
//   //   } else {
//   //     print(response.reasonPhrase);
//   //   }
//   // }
//
//   // GetSelectCatModel? selectCatModel;
//   // getCatApi() async {
//   //   SharedPreferences preferences = await SharedPreferences.getInstance();
//   //   String? Roll = preferences.getString('roll');
//   //   String? userId = preferences.getString('userId');
//   //   print("getRoll--------------->${Roll}");
//   //
//   //   var headers = {
//   //     'Cookie': 'ci_session=742f7d5e34b7f410d122da02dbbe7e75f06cadc8'
//   //   };
//   //   var request = http.MultipartRequest(
//   //       'POST', Uri.parse('${ApiService.selectCategory}'));
//   //   request.fields.addAll({'roll': '1', 'cat_type': "2", 'user_id': '$userId'});
//   //   print("this is a Response==========>${request.fields}");
//   //   request.headers.addAll(headers);
//   //   http.StreamedResponse response = await request.send();
//   //   if (response.statusCode == 200) {
//   //     //preferences.setString('id', "Id");
//   //     final result = await response.stream.bytesToString();
//   //     final finalResult = GetSelectCatModel.fromJson(jsonDecode(result));
//   //     print('_____Surendra _____${finalResult}_________');
//   //
//   //     setState(() {
//   //       selectCatModel = finalResult;
//   //     });
//   //   } else {
//   //     print(response.reasonPhrase);
//   //   }
//   // }
//
//   _CarouselSlider1() {
//     return CarouselSlider(
//       options: CarouselOptions(
//           onPageChanged: (index, result) {
//             setState(() {
//               _currentPost = index;
//             });
//           },
//           viewportFraction: 1.0,
//           initialPage: 0,
//           enableInfiniteScroll: true,
//           reverse: false,
//           autoPlay: true,
//           autoPlayInterval: Duration(seconds: 5),
//           autoPlayAnimationDuration: Duration(milliseconds: 500),
//           enlargeCenterPage: false,
//           scrollDirection: Axis.horizontal,
//           height: 180.0),
//       items: _sliderModel?.data?.map((item) {
//         return CommonSlider(file: item.image ?? '',);
//       }).toList(),
//     );
//   }
//
//   GetSliderModel? _sliderModel;
//   getSliderApi() async {
//     var headers = {
//       'Cookie': 'ci_session=ccb37a117d31b04c006884a89fbff3d1a39bffd7'
//     };
//     var request = http.Request('GET', Uri.parse('${ApiService.getSlider}'));
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//     if (response.statusCode == 200) {
//       var result = await response.stream.bytesToString();
//       print("this is a response===========>${result}");
//       final finalResult = GetSliderModel.fromJson(json.decode(result));
//       print("this is a response===========>${finalResult}");
//       setState(() {
//         _sliderModel = finalResult;
//       });
//     } else {
//       print(response.reasonPhrase);
//     }
//   }
//
//   void initState() {
//     super.initState();
//     print("this is my speiality  ${widget.speciality}");
//     Future.delayed(Duration(milliseconds: 300), () {
//       return getSliderApi();
//     });
//     getSliderApi();
//     getCategory();
//     if(widget.speciality == true){
//       setState(() {
//       });
//     }
//   }
//
//   final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
//       new GlobalKey<RefreshIndicatorState>();
//   Future<Null> _refresh() {
//     return callApi();
//   }
//
//   Future<Null> callApi() async {
//      // getuserProfile();
//     getSliderApi();
//
//   }
//
//   GetcategoryModel? getcategoryModel;
//   getCategory() async {
//     print("Get category APiiii");
//     var headers = {
//       'Cookie': 'ci_session=967018c55118c57e9b50bc9d10a91f021f6744e1'
//     };
//     var request = http.MultipartRequest('POST', Uri.parse('${ApiService.categories}'));
//
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//     if (response.statusCode == 200) {
//       var  result = await response.stream.bytesToString();
//       var finalResult = GetcategoryModel.fromJson(jsonDecode(result));
//       if(finalResult.status == true){
//       }else{
//         // Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscriptionPlan()));
//       }
//       print('category Apiii Responsee______${finalResult}');
//       setState(() {
//         getcategoryModel =  finalResult ;
//       });
//     }
//     else {
//     print(response.reasonPhrase);
//     }
//   }
//
//   CheckPlanModel? checkPlanModel;
//   checkSubscriptionApi() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     String? userId = preferences.getString('userId');
//     String? role = preferences.getString('roll');
//     print('__________${role}_________');
//     var headers = {
//       'Cookie': 'ci_session=64caa747045713fca2e42eb930c7387e303fd583'
//     };
//     var request = http.MultipartRequest('POST', Uri.parse('${ApiService.getCheckSubscriptionApi}'));
//     request.fields.addAll({
//       'user_id': "$userId",
//       'type':role =="1" ?"doctor":'pharma'
//     });
//     print('___sadsfdsfsdfsdafgsdgdg_______${request.fields}_________');
//     request.headers.addAll(headers);
//
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//      var  result = await response.stream.bytesToString();
//      var finalResult = CheckPlanModel.fromJson(jsonDecode(result));
//      if(finalResult.status == true){
//        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPosterScreen()));
//      }else{
//        Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscriptionPlan()));
//      }
//      print('____Bew Api______${finalResult}_________');
//      setState(() {
//       checkPlanModel =  finalResult ;
//      });
//     }
//     else {
//     print(response.reasonPhrase);
//     }
//   }
//
//   setFilterDataId( String id) async{
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     preferences.setString('LocalId', id );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         showDialog(
//             context: context,
//             barrierDismissible: false,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: Text("Confirm Exit"),
//                 content: Text("Are you sure you want to exit?"),
//                 actions: <Widget>[
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(primary: colors.primary),
//                     child: Text("YES"),
//                     onPressed: () {
//                       SystemNavigator.pop();
//                     },
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(primary: colors.primary),
//                     child: Text("NO"),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   )
//                 ],
//               );
//             });
//         return true;
//       },
//       child: RefreshIndicator(
//         key: _refreshIndicatorKey,
//         onRefresh: _refresh,
//         child: Scaffold(
//           backgroundColor: colors.whiteScaffold,
//           key: _key,
//           //appBar: customAppBar(context: context, text: "My Dashboard", isTrue: true, ),
//           body: SingleChildScrollView(
//             child: SafeArea(
//               child: Column(
//                 children: [
//                   SizedBox(height: 10),
//                   Stack(
//                     alignment: Alignment.bottomCenter,
//                     children: [
//                       SizedBox(
//                         //height: 200,
//                         width: double.maxFinite,
//                         child: _sliderModel == null
//                             ? const Center(
//                                 child: CircularProgressIndicator(
//                                 color: colors.primary,
//                               ))
//                             : _CarouselSlider1(),
//                       ),
//                       Positioned(
//                         bottom: 20,
//                         // left: 80,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: _buildDots(),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text("Categories",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: colors.primary),),
//                   SizedBox(height: 10,),
//                   customTabbar()
//                   // SizedBox(height: 100,),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   int _currentPost = 0;
//
//   List<Widget> _buildDots() {
//     List<Widget> dots = [];
//     if (_sliderModel == null) {
//     } else {
//       for (int i = 0; i < _sliderModel!.data!.length; i++) {
//         dots.add(
//           Container(
//             margin: EdgeInsets.all(1.5),
//             width: 6,
//             height: 6,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: _currentPost == i ? colors.secondary : colors.primary,
//             ),
//           ),
//         );
//       }
//     }
//     return dots;
//   }
//
//   int _currentIndex = 1;
//
//   customTabbar(){
//     return
//       Container(
//         height: 800,
//         child: GridView.builder(
//           scrollDirection: Axis.vertical,
//           itemCount: getcategoryModel?.data?.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             childAspectRatio: 8/7.9,
//             crossAxisCount: 2,
//           ),
//           itemBuilder: (BuildContext context, int index) {
//             return InkWell(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => TemplateScreen()));
//               },
//               child: Padding(
//                 padding: EdgeInsets.all(1),
//                 child: Card(
//                   color: Colors.white,
//                   elevation: 5,
//                   semanticContainer: true,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5.0),
//                     side: BorderSide(color: Colors.black, width: 2),
//                   ),
//                   // clipBehavior: Clip.antiAlias,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: <Widget>[
//                       Stack(
//                         children: [
//                           Container(
//                               height: 120,
//                               width: MediaQuery.of(context).size.width/1.7,
//                               child: Image.network("${getcategoryModel?.data?[index].img}", height: 80, width: 50, fit: BoxFit.fill,)
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 100),
//                             child: Container(
//                               height: 20,
//                               decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: Colors.black38),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       // SizedBox(height: 5),
//                       Row(
//                         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 50, top: 10),
//                             child: Center(
//                               child: Text("${getcategoryModel?.data?[index].cName}"
//                                   ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 10, fontFamily: 'Afrah')
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       );
//   }
// }

import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctorapp/Helper/Color.dart';
import 'package:doctorapp/Screen/CardScreen.dart';
import 'package:doctorapp/Screen/Histroy.dart';
import 'package:doctorapp/api/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../New_model/Check_plan_model.dart';
import '../New_model/EventListModel.dart';
import '../New_model/GetCountingModel.dart';
import '../New_model/GetSelectCatModel.dart';
import '../New_model/GetSliderModel.dart';
import '../New_model/GetcategoryModel.dart';
import '../New_model/TemplateForm.dart';
import '../New_model/TemplatesModel.dart';
import '../SubscriptionPlan/addPosterScreen.dart';
import '../SubscriptionPlan/subscription_plan.dart';
import '../widgets/widgets/commen_slider.dart';
import 'EventDetails.dart';
import 'Events.dart';
import 'TemplateScreen.dart';
import 'WishlistScreen.dart';

class HomeScreen extends StatefulWidget {
  final bool? speciality;
  final cityI;
  const HomeScreen({
    Key? key, this.speciality,this.cityI
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  SpeciplyData? localFilter;
  int currentindex = 0;

  // GetUserProfileModel? getprofile;
  // getuserProfile() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String? userId = preferences.getString('userId');
  //   print("getProfile--------------->${userId}");
  //   var headers = {
  //     'Cookie': 'ci_session=d9075fff59f39b7a82c03ca267be8899c1a9fbf8'
  //   };
  //   var request = http.MultipartRequest(
  //       'POST', Uri.parse('${ApiService.getUserProfile}'));
  //   request.fields.addAll({'user_id': '$userId'});
  //   print("getProfile--------------->${request.fields}");
  //   request.headers.addAll(headers);
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     var finalResult = await response.stream.bytesToString();
  //     final jsonResponse =
  //         GetUserProfileModel.fromJson(json.decode(finalResult));
  //     print("this is a ========>profile${jsonResponse}");
  //     print("emailllllll${getprofile?.user?.mobile}");
  //     setState(() {
  //       getprofile = jsonResponse;
  //     });
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }

  // GetSelectCatModel? selectCatModel;
  // getCatApi() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String? Roll = preferences.getString('roll');
  //   String? userId = preferences.getString('userId');
  //   print("getRoll--------------->${Roll}");
  //
  //   var headers = {
  //     'Cookie': 'ci_session=742f7d5e34b7f410d122da02dbbe7e75f06cadc8'
  //   };
  //   var request = http.MultipartRequest(
  //       'POST', Uri.parse('${ApiService.selectCategory}'));
  //   request.fields.addAll({'roll': '1', 'cat_type': "2", 'user_id': '$userId'});
  //   print("this is a Response==========>${request.fields}");
  //   request.headers.addAll(headers);
  //   http.StreamedResponse response = await request.send();
  //   if (response.statusCode == 200) {
  //     //preferences.setString('id', "Id");
  //     final result = await response.stream.bytesToString();
  //     final finalResult = GetSelectCatModel.fromJson(jsonDecode(result));
  //     print('_____Surendra _____${finalResult}_________');
  //
  //     setState(() {
  //       selectCatModel = finalResult;
  //     });
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }

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
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(milliseconds: 500),
          enlargeCenterPage: false,
          scrollDirection: Axis.horizontal,
          height: 180.0),
         items: _sliderModel?.data?.map((item) {
        return Container(
            width: MediaQuery.of(context).size.width/1.1,
            decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(20)),
            child: CommonSlider(file: item.image ?? '',));
      }).toList(),
    );
  }

  GetSliderModel? _sliderModel;
  getSliderApi() async {
    var headers = {
      'Cookie': 'ci_session=ccb37a117d31b04c006884a89fbff3d1a39bffd7'
    };
    var request = http.Request('GET', Uri.parse('${ApiService.getSlider}'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      print("this is a response===========>${result}");
      final finalResult = GetSliderModel.fromJson(json.decode(result));
      print("this is a response===========>${finalResult}");
      setState(() {
        _sliderModel = finalResult;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  void initState() {
    super.initState();
    print("this is my speiality  ${widget.speciality}");
    getCity_id();
    nearByEvevt();
    getTemplate();
    getCategory();
    // Future.delayed(Duration(milliseconds: 300), () {
    //   return getSliderApi();
    // });
    // getSliderApi();
    // if(widget.speciality == true){
    //   setState(() {
    //
    //   });
    // }
  }

  String? cityID;
  getCity_id()async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    cityID = preferences.getString('citi');
    print("citiee in homeee pageee ${cityID}");
  }

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  new GlobalKey<RefreshIndicatorState>();

  Future<Null> _refresh() {
    return callApi();
  }

  Future<Null> callApi() async {
    // getuserProfile();
    getSliderApi();
    nearByEvevt();
    getTemplate();
    getCategory();
  }

  TemplatesModel? templatesModel;
  getTemplate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("Get Template Apiiii");
    var headers = {
      'Cookie': 'ci_session=a36a8335f024c7b97f4162931f63227153359896'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiService.getservices}'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var  result = await response.stream.bytesToString();
      final jsonResponse = TemplatesModel.fromJson(json.decode(result));
      String? template_id = jsonResponse.data?.first.id ?? "";
      preferences.setString("template_id", template_id);
      print("Temaplteeee Idddd in home pagee${template_id}");
      if(jsonResponse.responseCode == "1"){
      }
      print('Templateee Apiii Responsee______${jsonResponse}');
      setState(() {
        templatesModel =  jsonResponse;
      });
      // templateView();
    }
    else {
      print(response.reasonPhrase);
    }
  }

  GetcategoryModel? getcategoryModel;
  getCategory() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("Get category APiiii");
    var headers = {
      'Cookie': 'ci_session=967018c55118c57e9b50bc9d10a91f021f6744e1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiService.categories}'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var  result = await response.stream.bytesToString();
      var finalResult = GetcategoryModel.fromJson(jsonDecode(result));
      if(finalResult.status == true){
        String? cat_id = finalResult.data![0].id.toString();
        getCity_id();
        preferences.setString("cat_id", cat_id);
        print("Categoryyy iddd iss ${cat_id}");
      }else{
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscriptionPlan()));
      }
      print("lenghttttttt${getcategoryModel?.data?.length}");
      print('category Apiii Responsee______${finalResult}');
      setState(() {
        getcategoryModel =  finalResult;
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }

  setFilterDataId( String id) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('LocalId', id );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Confirm Exit"),
                content: const Text("Are you sure you want to exit?"),
                actions: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: colors.primary),
                    child: const Text("YES"),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: colors.primary),
                    child: const Text("NO"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
        return true;
      },
      child: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: Scaffold(
          backgroundColor: colors.whiteScaffold,
          key: _key,
          //appBar: customAppBar(context: context, text:"My Dashboard", isTrue: true, ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // SizedBox(height: 20,),
                  // Stack(
                  //   alignment: Alignment.bottomCenter,
                  //   children: [
                  //     SizedBox(
                  //       //height: 200,
                  //       width: double.maxFinite,
                  //       child: _sliderModel == null
                  //           ? const Center(
                  //           child: CircularProgressIndicator(
                  //             color: colors.primary,
                  //           ))
                  //           : _CarouselSlider1(),
                  //     ),
                  //     Positioned(
                  //      top: 170,
                  //       // left: 80,
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: _buildDots(),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // )
                  customTabbar(),
                  // SizedBox(height: 100,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  int _currentPost = 0;
  List<Widget> _buildDots() {
    List<Widget> dots = [];
    if (_sliderModel == null) {
    } else {
      for (int i = 0; i < _sliderModel!.data!.length; i++) {
        dots.add(
          Container(
            margin: EdgeInsets.all(1.5),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPost == i ? Colors.white : Colors.black,
            ),
          ),
        );
      }
    }
    return dots;
  }


  String? city_id;
  EventListModel? eventListModel;
  nearByEvevt() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    city_id = preferences.getString("city_id");
    print("Citiesss id noww ${city_id}");
    var headers = {
      'Cookie': 'ci_session=e6545df7c1714023144b9f63cc94cd2118c2e751'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiService.geteventmanagers}'));
    request.fields.addAll({
      'city_id': cityID.toString()
    });
    print("City id in event manager page ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = EventListModel.fromJson(json.decode(finalResponse));
      setState(() {
        eventListModel = jsonResponse;
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }


  int currentIndex = 1;

  customTabbar(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 60),
              child: InkWell(
                onTap: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                child: Container(
                    height: 35,
                    width: 120,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 6, left: 40, right: 10),
                      child: Text(
                        'Card',
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
              padding: const EdgeInsets.only(top: 5),
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
                    height: 35,
                    width: 120,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 6, left: 30, right: 10),
                      child: Text(
                        'Events',
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
          height: 20,
        ),
        currentIndex == 1 ? customTabbarr(): myEnquiry(),
      ],
    );
  }

  customTabbarr() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 9),
          child: Text("Top Categories",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),),
        ),
        Container(
          height: 120,
          child:
          ListView.builder(
              shrinkWrap: true,
              itemCount: getcategoryModel?.data?.length,
              scrollDirection: Axis.horizontal,
              // physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index){
                return  InkWell(
                  onTap: (){
                    // getcategoryModel?.data?.forEach((element) {element.select=false;});
                    // getcategoryModel?.data?[index].select= true;
                    // setState(() {});
                    // templateView();
                    getTemplate();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage("${getcategoryModel?.data?[index].img}"),
                        ),
                        Text("${getcategoryModel?.data?[index].cName}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),)
                      ],
                    ),
                  ),
                );
              }
          ),
        ),
        templateView(),
        SizedBox(height: 50,)
      ],
    );
  }

  templateView() {
    print("mmmmmmmmmmmmm ${templatesModel}");
    return
      Container(
        // height: MediaQuery.of(context).size.height/0.1,
        child: templatesModel == null ? Center(child: Text("No template to show")) : GridView.builder(
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: templatesModel?.data?.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2/3,
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => CardScreen(
                //     name: name, address: address, image: widget.image, datee: dateinput.text.toString(), timee: timecon.text, id:widget.id.toString()
                // ),
                // ),
                // );
                Navigator.push(context, MaterialPageRoute(builder: (context) => Form_Screen (image: templatesModel?.data?[index].image, id:templatesModel?.data?[index].id)));
              },
              child: Padding(
                padding: EdgeInsets.all(1),
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  semanticContainer: true,
                  // clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                          // height: 198,
                          child: Image.network("${templatesModel?.data?[index].preview}",fit: BoxFit.fill)
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
  }

  // myCard() {
  //   return
  //     // Container(
  //     //   height: 500,
  //     //   child: templatesModel == null ? Center(child: Text("No template to show")) : GridView.builder(
  //     //     scrollDirection: Axis.vertical,
  //     //     itemCount: templatesModel?.data?.length,
  //     //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //     //       childAspectRatio: 9/7.9,
  //     //       crossAxisCount: 2,
  //     //     ),
  //     //     itemBuilder: (BuildContext context, int index) {
  //     //       return InkWell(
  //     //         onTap: () {
  //     //           Navigator.push(context, MaterialPageRoute(builder: (context) => Form_Screen(image: templatesModel?.data?[index].image)));
  //     //         },
  //     //         child: Padding(
  //     //           padding: EdgeInsets.all(1),
  //     //           child: Card(
  //     //             color: Colors.white,
  //     //             elevation: 5,
  //     //             semanticContainer: true,
  //     //             // clipBehavior: Clip.antiAlias,
  //     //             child: Column(
  //     //               crossAxisAlignment: CrossAxisAlignment.start,
  //     //               mainAxisAlignment: MainAxisAlignment.start,
  //     //               children: <Widget>[
  //     //                 Stack(
  //     //                   children: [
  //     //                     Container(
  //     //                         height: 148,
  //     //                         width: MediaQuery.of(context).size.width/1.7,
  //     //                         child: Image.network("${templatesModel?.data?[index].preview}", height: 80, width: 50, fit: BoxFit.fill)
  //     //                     ),
  //     //                   ],
  //     //                 ),
  //     //               ],
  //     //             ),
  //     //           ),
  //     //         ),
  //     //       );
  //     //     },
  //     //   ),
  //     // );
  // }

  myEnquiry() {
    return
      Column(
        children: [
          eventListModel == null ? Center(
              child: CircularProgressIndicator(color: colors.primary)
          ):
          ListView.builder(
              shrinkWrap: true,
              itemCount: eventListModel?.data?.length,
              scrollDirection: Axis.vertical,
              // physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index){
                return  InkWell(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetails(data: eventListModel!.data![index])));
                  },
                  child: Card(
                    margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    elevation: 5.0,
                    child: Container(
                      height: MediaQuery.of(context).size.width/3,
                      width: MediaQuery.of(context).size.width/1,
                      child: Row(
                        children: [
                          const Padding(padding: EdgeInsets.all(10)),
                          Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                              height: 140,
                              width: 140,
                              child: Image.network("${eventListModel?.data?[index].profileImage}")
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            margin: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.only(top: 15)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Name:",textAlign: TextAlign.right),
                                    SizedBox(width: 3),
                                    Container(
                                        width: 80,
                                        child: Text("${eventListModel?.data?[index].uname}", overflow: TextOverflow.ellipsis)),
                                  ],
                                ),
                                // SizedBox(height: 5),
                                // Row(
                                //   children: [
                                //     Text("Mobile no:",textAlign: TextAlign.right),
                                //     Text("${eventListModel?.data?[index].mobile}"),
                                //   ],
                                // ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text("City:",textAlign: TextAlign.right),
                                    SizedBox(width: 3),
                                    Text("${eventListModel?.data?[index].cityName}")
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
          ),
        ],
      );
  }
}

