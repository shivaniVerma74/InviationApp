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
//   //     print('_____Surendra _${finalResult}_________');
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
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../New_model/AllCategoryModel.dart';
import '../New_model/Check_plan_model.dart';
import '../New_model/EventListModel.dart';
import '../New_model/GetCountingModel.dart';
import '../New_model/GetSelectCatModel.dart';
import '../New_model/GetSliderModel.dart';
import '../New_model/GetcategoryModel.dart';
import '../New_model/NewCategoryModel.dart';
import '../New_model/SavedCardModel.dart';
import '../New_model/TemplateForm.dart';
import '../New_model/TemplatesModel.dart';
import '../SubscriptionPlan/addPosterScreen.dart';
import '../SubscriptionPlan/subscription_plan.dart';
import '../widgets/widgets/commen_slider.dart';
import 'EventDetails.dart';
import 'Events.dart';
import 'MyEnquiry.dart';
import 'TemplateScreen.dart';
import 'WeddingForm.dart';
import 'WishlistScreen.dart';
import 'my_Enquiry.dart';

class HomeScreen extends StatefulWidget {
  final bool? speciality;
  final cityI;
  const HomeScreen({Key? key, this.speciality, this.cityI}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  SpeciplyData? localFilter;
  int currentindex = 0;


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
          height: 100.0),
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
      print("this is a response===========> $finalResult");
      setState(() {
        _sliderModel = finalResult;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  void initState() {
    super.initState();
    getSliderApi();
    getCard();
    getCity_id();
    nearByEvevt();
    getTemplate();
    getCategory();
    allCategory();
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    Fluttertoast.showToast(msg: "Card added successfully");
    // purchaseCard();
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment cancelled by user");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
  }

  String? cityID;
  getCity_id() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    cityID = preferences.getString('citi');
    print("citiee in homeee pageee $cityID");
  }

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();

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

  NewCategoryModel? weddingCardList;
  NewCategoryModel? birthDayCardList;
  AllCategoryModel? allCategoriesModel;
  getCategory() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("Get category APiiii");
    var headers = {
      'Cookie': 'ci_session=967018c55118c57e9b50bc9d10a91f021f6744e1'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiService.categories));

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
        print("Categoryyy iddd iss $cat_id");
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


  allCategory() async {
    var headers = {
      'Cookie': 'ci_session=967018c55118c57e9b50bc9d10a91f021f6744e1'
    };
    var request =
    http.MultipartRequest('POST', Uri.parse(ApiService.categories));
    request.fields.addAll({
      'cat_type': '1'
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      final jsonResponse = AllCategoryModel.fromJson(json.decode(result));
      print('categoriess responsee $jsonResponse');
      setState(() {
        allCategoriesModel = jsonResponse;
        print("alll catetetetetety ${allCategoriesModel?.data?.first.cName}");
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  setFilterDataId(String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('LocalId', id);
  }


  void _showReligionDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: religion(),
        );
      },
    );
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
                    style: ElevatedButton.styleFrom(primary: colors.secondary),
                    child: const Text("YES"),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: colors.secondary),
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
          // extendBodyBehindAppBar: true,
          backgroundColor: colors.scaffoldBackground,
          key: _key,
          //appBar: customAppBar(context: context, text:"My Dashboard", isTrue: true, ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
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
            margin: const EdgeInsets.all(1.5),
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
    SharedPreferences pref = await SharedPreferences.getInstance();
    city_id = pref.getString('Selected_city');
    print("Citiesss id noww $city_id");
    var headers = {
      'Cookie': 'ci_session=e6545df7c1714023144b9f63cc94cd2118c2e751'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse(ApiService.geteventmanagers));
    request.fields.addAll({'city_id': city_id.toString()});
    print("City id in event manager page ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = EventListModel.fromJson(json.decode(finalResponse));
      setState(() {
        eventListModel = jsonResponse;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  int? newIndex;

  List<Map<String, dynamic>> temList = [
    {
      'id': 1,
    },
    {
      'id': 2,
    },
  ];

  int currentIndex = 1;

  customTabbar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              child: Container(
                height: 90,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                    // color: currentIndex == 1
                    //     ? Colors.white
                    //     : Colors.white,
                    // border: Border.all(color: colors.primary),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Container(
                      width: 90,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/cardimage.png",
                            height: 30,
                            width: 30,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Saved',
                            style: TextStyle(
                              color: currentIndex == 1
                                  ? colors.secondary
                                  : colors.blackTemp,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Divider(
                      thickness: 4,
                      color: currentIndex == 1
                          ? colors.secondary
                          : Colors.white.withOpacity(0),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {

                print("");
                setState(() {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => NextPage(),
                  // ));
                  currentIndex = 2;
                });
              },
              child: Container(
                height: 90,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                    // color: currentIndex == 2
                    //     ? colors.primary
                    //     : Colors.white,
                    // border: Border.all(color: colors.primary),
                    borderRadius: BorderRadius.circular(5)),
                child:
                  // padding: const EdgeInsets.only(top: 1, left: 30, right: 10),
                  Column(
                    children: [
                      Container(
                        width: 90,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/booking.png",
                              height: 30,
                              width: 30,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Downloaded',
                              style: TextStyle(
                                color: currentIndex == 2 ? colors.secondary : colors.blackTemp, fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 4,
                        color: currentIndex == 2 ? colors.secondary : Colors.white.withOpacity(0),
                      ),
                    ],
                  ),

              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => NextPage(),
                  // ));
                  currentIndex = 3;
                });
              },
              child: Container(
                height: 90,
                width: MediaQuery.of(context).size.width/3,
                decoration: BoxDecoration(
                    // color: currentIndex == 2
                    //     ? colors.primary
                    //     : Colors.white,
                    // border: Border.all(color: colors.primary),
                    borderRadius: BorderRadius.circular(5),
                ),
                child:
                  //padding: const EdgeInsets.only(top: 1, left: 30, right: 10),
                  Column(
                    children: [
                      Container(
                        width: 90,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/eventimage.png",
                              height: 30,
                              width: 30,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Invite',
                              style: TextStyle(
                                color: currentIndex == 3
                                    ? colors.secondary
                                    : colors.blackTemp,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 4,
                        color: currentIndex == 3
                            ? colors.secondary
                            : Colors.white.withOpacity(0),
                      ),
                    ],
                  ),

              ),
            ),
          ],
        ),
        // currentIndex == 1 ?
        // SizedBox(
        //         //height: 200,
        //         width: double.maxFinite,
        //         child: _sliderModel == null
        //             ? const Center(
        //                 child: CircularProgressIndicator(
        //                   color: colors.secondary,
        //                 ),
        //               )
        //             : _CarouselSlider1(),
        //       )
        //     : Container(),
        // const SizedBox(
        //   height: 20,
        // ),
        currentIndex == 1
            ? myCard()
            : currentIndex == 2
               ? getCategories()
                // ?
                : Container(child: const Center(child: Text("No Data Available"))),
      ],
    );
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
    print("rrrrrr ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = SavedCardModel.fromJson(json.decode(finalResponse));
      print("Get Enquiry**** $jsonResponse");
      setState(() {
        savedCardModel = SavedCardModel.fromJson(json.decode(finalResponse));
      });
      // print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  String? selectedReligion;
  religion() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Select your religion:',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 20),
        DropdownButton<String>(
          value: selectedReligion,
          // icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          onChanged: (String? newValue) {
            setState(() {

              selectedReligion = newValue;
            });
          },
          items: <String>['Christianity', 'Islam', 'Hinduism', 'Buddhism', 'Judaism']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        // Text(
        //   'Selected Religion: ${selectedReligion ?? 'None'}',
        //   style: const TextStyle(fontSize: 18),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: colors.secondary,
                    fixedSize: Size(100, 40)
                ),
                onPressed: () {

                },
                child: const Padding(
                  padding:  EdgeInsets.all(4.0),
                  child:  Text("Submit",),
                )),
            const SizedBox(width: 32,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: colors.secondary),
                onPressed: () {

                },
                child: const Padding(
                  padding:  EdgeInsets.all(4.0),
                  child:  Text("Skip",),
                )),
          ],
        ),
      ],
    );
  }

  myCard() {
    return savedCardModel?.status == false ? const Text("No Card Found")
        : savedCardModel?.data?.length == null || savedCardModel?.data?.length == ""
        ? const Center(
        child: CircularProgressIndicator(
        color: colors.secondary),
    ): ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: savedCardModel?.data?.length,
        itemBuilder: (context, i) {
          return templateCard1(i);
        });
  }

  templateCardGestures({String? text, Icon? icon, VoidCallback? onTap}){

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          icon!,
          const SizedBox(height: 2,),
          Text(text!, style: const TextStyle(color: Colors.black,fontSize: 16),)
        ],
      ),
    );



  }

   templateCard1(int i){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              _showReligionDialog(context);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const WeddingForm()));
            },
            child: Container(
              clipBehavior: Clip.hardEdge,
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.network(
                                    "${savedCardModel?.data?[i].image}", fit: BoxFit.fill,
                                  ),
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 templateCardGestures(
                   text: 'Saved',
                   icon: Icon(Icons.download,color: Colors.black,),
                   onTap: (){}
                 ),
              templateCardGestures(
                  text: 'Downloaded',
                  icon: Icon(Icons.download,color: Colors.black,),
                  onTap: (){}
              ),
              templateCardGestures(
                  text: 'invite',
                  icon: Icon(Icons.insert_invitation,color: Colors.black),
                  onTap: (){}
              )
            ],),
          )
        ],
      ),
    );
   }
  // templateCard(int index) {
  //   GlobalKey keyList = GlobalKey();
  //   return Column(
  //     children: [
  //       Card(
  //         elevation: 6,
  //         child: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Column(
  //             children: [
  //               RepaintBoundary(
  //                 key: keyList,
  //                 child: Container(
  //                   height: MediaQuery.of(context).size.height/2,
  //                   child: Image.network(
  //                     "${savedCardModel?.data?[index].image}", fit: BoxFit.fill,
  //                   ),
  //                 ),
  //               ),
  //               Container(
  //                 height: 70,
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(10),
  //                 ),
  //                 child: Card(
  //                   elevation: 0,
  //                   child: Column(
  //                     children: [
  //                       // const Text(
  //                       //   "Save",
  //                       //   style: TextStyle(
  //                       //       fontSize: 12, fontWeight: FontWeight.w800),
  //                       // ),
  //                       // const SizedBox(width: 5),
  //                       // Container(
  //                       //   height: 40,
  //                       //   width: 40,
  //                       //   decoration: BoxDecoration(
  //                       //       borderRadius: BorderRadius.circular(10),
  //                       //       color: colors.secondary),
  //                       //   child: IconButton(
  //                       //       onPressed: () {
  //                       //         // setState(() {
  //                       //         // });
  //                       //         // _share(keyList);
  //                       //       },
  //                       //       icon: const Icon(Icons.save,
  //                       //           color: Colors.white)),
  //                       // ),
  //                       // SizedBox(
  //                       //     width: MediaQuery.of(context).size.width / 2.7),
  //                       const Text("Download",
  //                           style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800)),
  //                       const SizedBox(width: 5),
  //                       Container(
  //                         height: 40,
  //                         width: 40,
  //                         decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(10),
  //                             color: colors.secondary),
  //                         child: IconButton(
  //                           onPressed: () async {
  //                             openCheckout('100');
  //                             // saveImage(keyList);
  //                             // downloadFile();
  //                           },
  //                           icon: const Icon(Icons.download,
  //                               color: Colors.white),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Razorpay? _razorpay;
  int? pricerazorpayy;
  void openCheckout(amount) async {
    double res = double.parse(amount.toString());
    pricerazorpayy= int.parse(res.toStringAsFixed(0)) * 100;
    print("checking razorpay price ${pricerazorpayy.toString()}");
    print("checking razorpay price ${pricerazorpayy.toString()}");
    // Navigator.of(context).pop();
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': "$pricerazorpayy",
      'name': 'Invitation',
      'image':'assets/images/homeimage.png',
      'description': 'Invitation',
    };
    try {
      _razorpay?.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  // customTabbar() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Row(
  //         children: [
  //           InkWell(
  //             onTap: () {
  //               setState(() {
  //                 currentIndex = 1;
  //               });
  //             },
  //             child: Container(
  //               height: 90,
  //               width: MediaQuery.of(context).size.width / 3,
  //               decoration: BoxDecoration(
  //                 // color: currentIndex == 1
  //                 //     ? Colors.white
  //                 //     : Colors.white,
  //                 // border: Border.all(color: colors.primary),
  //                   borderRadius: BorderRadius.circular(5)),
  //               child: Column(
  //                 children: [
  //                   Image.asset(
  //                     "assets/images/cardimage.png",
  //                     height: 30,
  //                     width: 30,
  //                   ),
  //                   const SizedBox(height: 6),
  //                   Text(
  //                     'Design Card',
  //                     style: TextStyle(
  //                       color: currentIndex == 1
  //                           ? colors.secondary
  //                           : colors.blackTemp,
  //                       fontSize: 16,
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
  //           InkWell(
  //             onTap: () {
  //               setState(() {
  //                 // Navigator.of(context).push(MaterialPageRoute(
  //                 //   builder: (context) => NextPage(),
  //                 // ));
  //                 currentIndex = 3;
  //               });
  //             },
  //             child: Container(
  //               height: 90,
  //               width: MediaQuery.of(context).size.width / 3,
  //               decoration: BoxDecoration(
  //                 // color: currentIndex == 2
  //                 //     ? colors.primary
  //                 //     : Colors.white,
  //                 // border: Border.all(color: colors.primary),
  //                   borderRadius: BorderRadius.circular(5)),
  //               child: Padding(
  //                 padding: const EdgeInsets.only(top: 1, left: 30, right: 10),
  //                 child: Column(
  //                   children: [
  //                     Image.asset(
  //                       "assets/images/booking.png",
  //                       height: 30,
  //                       width: 30,
  //                     ),
  //                     const SizedBox(height: 5),
  //                     Text(
  //                       'Booking',
  //                       style: TextStyle(
  //                         color: currentIndex == 3
  //                             ? colors.secondary
  //                             : colors.blackTemp,
  //                         fontSize: 16,
  //                       ),
  //                     ),
  //                     Divider(
  //                       thickness: 4,
  //                       color: currentIndex == 3
  //                           ? colors.secondary
  //                           : Colors.white.withOpacity(0),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //           InkWell(
  //             onTap: () {
  //               setState(() {
  //                 // Navigator.of(context).push(MaterialPageRoute(
  //                 //   builder: (context) => NextPage(),
  //                 // ));
  //                 currentIndex = 2;
  //               });
  //             },
  //             child: Container(
  //               height: 90,
  //               width: MediaQuery.of(context).size.width / 3,
  //               decoration: BoxDecoration(
  //                 // color: currentIndex == 2
  //                 //     ? colors.primary
  //                 //     : Colors.white,
  //                 // border: Border.all(color: colors.primary),
  //                   borderRadius: BorderRadius.circular(5)),
  //               child: Padding(
  //                 padding: const EdgeInsets.only(top: 1, left: 30, right: 10),
  //                 child: Column(
  //                   children: [
  //                     Image.asset(
  //                       "assets/images/eventimage.png",
  //                       height: 30,
  //                       width: 30,
  //                     ),
  //                     const SizedBox(height: 5),
  //                     Text(
  //                       'Events',
  //                       style: TextStyle(
  //                         color: currentIndex == 2
  //                             ? colors.secondary
  //                             : colors.blackTemp,
  //                         fontSize: 16,
  //                       ),
  //                     ),
  //                     Divider(
  //                       thickness: 4,
  //                       color: currentIndex == 2
  //                           ? colors.secondary
  //                           : Colors.white.withOpacity(0),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //       currentIndex == 1 ?
  //       SizedBox(
  //         //height: 200,
  //         width: double.maxFinite,
  //         child: _sliderModel == null
  //             ? const Center(
  //           child: CircularProgressIndicator(
  //             color: colors.secondary,
  //           ),
  //         )
  //             : _CarouselSlider1(),
  //       )
  //           : Container(),
  //       // const SizedBox(
  //       //   height: 20,
  //       // ),
  //       currentIndex == 1
  //           ? customTabbarr()
  //           : currentIndex == 3
  //           ? getCategories()
  //       // ?
  //           : Container(
  //         child: Center(child: Text("No Events Avaliable")),
  //       ),
  //     ],
  //   );
  // }

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
              itemCount: birthDayCardList?.data == null ? 0
                  : birthDayCardList?.data?[0].templates!.length,
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
                              birthDayCardList?.data?[index].templates![index].preview ?? '',
                            ),
                            fit: BoxFit.fill),
                    ),
                  ),
                );
              }),
          // newIndex == 1?
          // templateView2(e): templateView(),
          const SizedBox(height: 50)
        ],
      ),
    );
  }

  Widget templateView2(Templates templates, int i) {
    print("templates $templatesModel");
    return Container(
      height: MediaQuery.of(context).size.height / 2.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const WeddingForm()));
            },
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child:
                        // Image.network(templates.preview ?? '', fit: BoxFit.fill)
                        i == 0
                            ? Image.asset("assets/images/wddingimg.png")
                            : Image.network("${templates.preview}",
                                fit: BoxFit.fill)),
              ),
            ),
          );
        },
      ),
    );
  }

  templateView() {
    return Container(
      height: MediaQuery.of(context).size.height / 2.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // shrinkWrap: true,
        itemCount: templatesModel?.data?.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Form_Screen(
                          image: templatesModel?.data?[index].image,
                          temp_Id: templatesModel?.data?[index].id)));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  // height: 198,
                  child: Image.network(
                      "${templatesModel?.data?[index].preview}",
                      fit: BoxFit.fill)),
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


  getCategories(){
    return savedCardModel?.status == false ? Text("No Card Found")
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
          return downloadCard1(i);
            // downloadCard(i);
        });
  }

  downloadCard1(int i){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const WeddingForm()));
            },
            child: Container(
              clipBehavior: Clip.hardEdge,
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.network(
                "${savedCardModel?.data?[i].image}", fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // templateCardGestures(
                //     text: 'Saved',
                //     icon: Icon(Icons.download,color: Colors.black,),
                //     onTap: (){}
                // ),
                templateCardGestures(
                    text: 'Downloaded',
                    icon: Icon(Icons.download,color: Colors.black,),
                    onTap: (){}
                ),
                templateCardGestures(
                    text: 'invite',
                    icon: Icon(Icons.insert_invitation,color: Colors.black),
                    onTap: (){}
                )
              ],),
          )
        ],
      ),
    );
  }

  // downloadCard(int index) {
  //   GlobalKey keyList = GlobalKey();
  //   return Column(
  //     children: [
  //       Card(
  //         elevation: 6,
  //         child: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Column(
  //             children: [
  //               RepaintBoundary(
  //                 key: keyList,
  //                 child: Container(
  //                   height: MediaQuery.of(context).size.height/2,
  //                   child: Image.network(
  //                     "${savedCardModel?.data?[index].image}", fit: BoxFit.fill,
  //                   ),
  //                 ),
  //               ),
  //               Container(
  //                 height: 70,
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(10),
  //                 ),
  //                 child: Card(
  //                   elevation: 0,
  //                   child: Column(
  //                     children: [
  //                       // const Text(
  //                       //   "Save",
  //                       //   style: TextStyle(
  //                       //       fontSize: 12, fontWeight: FontWeight.w800),
  //                       // ),
  //                       // const SizedBox(width: 5),
  //                       // Container(
  //                       //   height: 40,
  //                       //   width: 40,
  //                       //   decoration: BoxDecoration(
  //                       //       borderRadius: BorderRadius.circular(10),
  //                       //       color: colors.secondary),
  //                       //   child: IconButton(
  //                       //       onPressed: () {
  //                       //         // setState(() {
  //                       //         // });
  //                       //         // _share(keyList);
  //                       //       },
  //                       //       icon: const Icon(Icons.save,
  //                       //           color: Colors.white)),
  //                       // ),
  //                       // SizedBox(
  //                       //     width: MediaQuery.of(context).size.width / 2.7),
  //                       const Text("Share",
  //                           style: TextStyle(
  //                               fontSize: 11, fontWeight: FontWeight.w800)),
  //                       const SizedBox(width: 5),
  //                       Container(
  //                         height: 40,
  //                         width: 40,
  //                         decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(10),
  //                             color: colors.secondary),
  //                         child: IconButton(
  //                           onPressed: () async {
  //                             share();
  //                             // saveImage(keyList);
  //                             // downloadFile();
  //                           },
  //                           icon: const Icon(Icons.share,
  //                               color: Colors.white),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //
  //     ],
  //   );
  // }


  Future<void> share() async {
    await FlutterShare.share(
        title: 'Atithi',
        // text: 'Example share text',
        linkUrl: 'https://developmentalphawizz.com/dr_booking/',
        chooserTitle: 'Atithi');
  }


  // getCategories(){
  //   return Container(
  //     height: MediaQuery.of(context).size.height/1.2,
  //     child:GridView.builder(
  //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //           crossAxisCount: 2,
  //           crossAxisSpacing: 5,
  //           mainAxisSpacing: 5,
  //         ),
  //         itemCount:allCategoriesModel!.data!.length,
  //         itemBuilder: (BuildContext context, int index) {
  //
  //           print('Ssssss  ------${allCategoriesModel!.data![index].temp.toString()}');
  //           return Padding(
  //             padding: const EdgeInsets.all(0.0),
  //             child: InkWell(
  //               onTap: (){
  //                 Navigator.push(context, MaterialPageRoute(builder: (context)=>  BookingDetails(
  //                   model: allCategoriesModel!.data![index].temp,
  //                   ind: index,
  //                 ),
  //                 ),
  //                 );
  //               },
  //               child: Card(
  //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //                 elevation: 5,
  //                 color: colors.whiteTemp,
  //                 child: Column(
  //                   children: [
  //                     ClipRRect(
  //                         borderRadius:BorderRadius.circular(10),
  //                         child: Image.network("${allCategoriesModel!.data![index].img}",height: 130,width: double.infinity,)),
  //                     SizedBox(height: 5,),
  //                     Text("${allCategoriesModel!.data![index].cName}")
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           );
  //         }
  //     ),
  //
  //   );
  // }


  myEnquiry() {
    return eventListModel?.status == false
        ? Center(
            child: Text("No Booking Found "),
          )
          :Column(
            children: [
              eventListModel == null
                  ? Center(
                      child: CircularProgressIndicator(color: colors.secondary))
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: eventListModel?.data?.length,
                      scrollDirection: Axis.vertical,
                      // physics: AlwaysScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EventDetails(
                                        data: eventListModel!.data![index])));
                          },
                          child: Card(
                            margin: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5.0,
                            child: Container(
                              height: MediaQuery.of(context).size.width / 3,
                              width: MediaQuery.of(context).size.width / 1,
                              child: Row(
                                children: [
                                  const Padding(padding: EdgeInsets.all(10)),
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      height: 140,
                                      width: 140,
                                      child: Image.network(
                                          "${eventListModel?.data?[index].profileImage}")),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    alignment: Alignment.topRight,
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                            padding: EdgeInsets.only(top: 15)),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Name:",
                                                textAlign: TextAlign.right),
                                            SizedBox(width: 3),
                                            Container(
                                                width: 80,
                                                child: Text(
                                                    "${eventListModel?.data?[index].uname}",
                                                    overflow:
                                                        TextOverflow.ellipsis)),
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
                                            Text("City:",
                                                textAlign: TextAlign.right),
                                            SizedBox(width: 3),
                                            Text(
                                                "${eventListModel?.data?[index].cityName}")
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
                      }),
            ],
          );
  }
}