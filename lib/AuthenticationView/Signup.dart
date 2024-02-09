// import 'dart:convert';
// import 'dart:io';
// import 'package:doctorapp/AuthenticationView/LoginScreen.dart';
// import 'package:doctorapp/Helper/Color.dart';
// import 'package:doctorapp/New_model/GetCityModel.dart';
// import 'package:doctorapp/New_model/registration_model2.dart';
// import 'package:doctorapp/Screen/Bottom.dart';
// import 'package:doctorapp/api/api_services.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
// import 'package:place_picker/entities/location_result.dart';
// import 'package:place_picker/widgets/place_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../Helper/AppBtn.dart';
// import '../Helper/Appbar.dart';
// import 'package:http/http.dart' as http;
//
// import '../New_model/GetStateModel.dart';
// import '../Registration/drverification.dart';
//
// class SignupScreen extends StatefulWidget {
//   SignupScreen({Key? key,}) : super(key: key);
//
//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }
//
// class _SignupScreenState extends State<SignupScreen> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController mobileController = TextEditingController();
//   TextEditingController currentLocationController = TextEditingController();
//   TextEditingController addressCtr = TextEditingController();
//
//   bool isLoading = false;
//   File? imageFile;
//   Position? currentLocation;
//   File? newImageFile;
//   double pickLat = 0;
//   double pickLong = 0;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Future.delayed(Duration(milliseconds: 400),(){
//       return addCities();
//     });
//
//   }
//
//  String ? cuooooo;
//   getCity_id()async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     preferences.setString('citi', "${cities}");
//     print("citiescitiescitiescitiescities ${cities}");
//   }
//
//   RegistrationModel2? detailsData;
//   registrationApi() async {
//  setState(() {
//    isLoading == true;
//  });
//     var headers = {
//       'Cookie': 'ci_session=dd50c278f09355c16fbac67ed21dae08884302f4'
//     };
//     var request = http.MultipartRequest('POST', Uri.parse('${ApiService.userRegister}'));
//     request.fields.addAll({
//       'name': nameController.text,
//       'email': emailController.text,
//       'mobile': mobileController.text,
//       'address': "Indore",
//       'city_id': cities.toString(),
//       'lat': "",
//       'lng':"",
//     });
//     print('____request.fields${request.fields}_________');
//
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//     if (response.statusCode == 200) {
//       print("Apiiiii workinggggg");
//      var result =  await response.stream.bytesToString();
//      var finalResult =  jsonDecode(result);
//       getCity_id();
//      Fluttertoast.showToast(msg: finalResult['message']);
//      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(cityId:cities)));
//      setState(() {
//        isLoading = false;
//      });
//      nameController.clear();
//      emailController.clear();
//      mobileController.clear();
//     }
//     else {
//       setState(() {
//         isLoading = false;
//       });
//       print(response.reasonPhrase);
//     }
//   }
//
//   GetCityModel? getCityModel;
//   String? city_id;
//
//   addCities() async{
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     print("Addd city Apiiii");
//     var headers = {
//       'Cookie': 'ci_session=47a33758cb5f8f90b12340c2f31188b7fc5f9f92'
//     };
//
//     var request = http.MultipartRequest('POST', Uri.parse('${ApiService.getcitylist}'));
//     request.fields.addAll({
//       'state_id': '2'
//     });
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//     if (response.statusCode == 200) {
//       var finalResponse = await response.stream.bytesToString();
//       final jsonResponse = GetCityModel.fromJson(json.decode(finalResponse));
//        String city_id = jsonResponse!.data![0].id ?? "";
//        preferences.setString("city_id", city_id);
//        print("city id herre ${city_id}");
//       setState(() {
//         getCityModel = jsonResponse;
//       });
//       // print("City Herererre ${getCityModel!.data![0].name}");
//     }
//     else {
//       print(response.reasonPhrase);
//     }
//   }
//
//   GetStateModel? getStateModel;
//   getState() async {
//     var headers = {
//       'Cookie': 'ci_session=d01e57d25f187766341c297a71e6a3ab1679cf1e'
//     };
//     var request = http.MultipartRequest('POST', Uri.parse('${ApiService.getStates}'));
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//     if (response.statusCode == 200) {
//       print(await response.stream.bytesToString());
//     }
//     else {
//     print(response.reasonPhrase);
//     }
//   }
//
//
//   String? cities;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: customAppBar(text: "Sign Up", isTrue: true, context: context),
//         body: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//             child: SingleChildScrollView(
//                 child: Form(
//                     key: _formKey,
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                               padding: EdgeInsets.all(5.0),
//                               child: Row(
//                                 children: const [
//                                   Text(
//                                     "Name",
//                                     style: TextStyle(
//                                         color: colors.black54,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Text(
//                                     "*",
//                                     style: TextStyle(
//                                         color: colors.red,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 10),
//                                   ),
//                                 ],
//                               )),
//                           TextFormField(
//                             style: TextStyle(color: colors.black54),
//                             controller: nameController,
//                             keyboardType: TextInputType.emailAddress,
//                             decoration: InputDecoration(
//                                 hintText: 'Enter name',
//                                 hintStyle: const TextStyle(
//                                     fontSize: 15.0, color: colors.secondary),
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10)),
//                                 contentPadding:
//                                     EdgeInsets.only(left: 10, top: 10)),
//                             validator: (v) {
//                               if (v!.isEmpty) {
//                                 return "name is required";
//                               }
//                             },
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Padding(
//                               padding: const EdgeInsets.all(5.0),
//                               child: Row(
//                                 children: const [
//                                   Text(
//                                     "Mobile No",
//                                     style: TextStyle(
//                                         color: colors.black54,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Text(
//                                     "*",
//                                     style: TextStyle(
//                                         color: colors.red,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 10,
//                                     ),
//                                   ),
//                                 ],
//                               )),
//                           TextFormField(
//                             style: TextStyle(color: colors.black54),
//                             controller: mobileController,
//                             keyboardType: TextInputType.number,
//                             maxLength: 10,
//                             decoration: InputDecoration(
//                                 counterText: "",
//                                 hintText: 'Enter mobile',
//                                 hintStyle: TextStyle(
//                                     fontSize: 15.0, color: colors.secondary),
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10)),
//                                 contentPadding:
//                                     EdgeInsets.only(left: 10, top: 10)),
//                             validator: (v) {
//                               if (v!.length < 10) {
//                                 return "mobile number is required";
//                               }
//                             },
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Padding(
//                               padding: EdgeInsets.all(5.0),
//                               child: Row(
//                                 children: const [
//                                   Text(
//                                     "Email Id",
//                                     style: TextStyle(
//                                         color: colors.black54,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Text(
//                                     "*",
//                                     style: TextStyle(
//                                         color: colors.red,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 10),
//                                   ),
//                                 ],
//                               )),
//                           TextFormField(
//                             style: TextStyle(color: colors.black54),
//                             controller: emailController,
//                             keyboardType: TextInputType.emailAddress,
//                             decoration: InputDecoration(
//                                 hintText: 'Enter email',
//                                 hintStyle: const TextStyle(
//                                     fontSize: 15.0, color: colors.secondary),
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10)),
//                                 contentPadding:
//                                     EdgeInsets.only(left: 10, top: 10)),
//                             validator: (v) {
//                               if (v!.isEmpty) {
//                                 return "Email is required";
//                               }
//                               if (!v.contains("@")) {
//                                 return "Enter Valid Email Id";
//                               }
//                             },
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Padding(
//                               padding: EdgeInsets.all(5.0),
//                               child: Row(
//                                 children: const [
//                                   Text(
//                                     "Cities",
//                                     style: TextStyle(
//                                         color: colors.black54,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Text(
//                                     "*",
//                                     style: TextStyle(
//                                         color: colors.red,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 10),
//                                   ),
//                                 ],
//                               ),
//                           ),
//                           Card(
//                             elevation: 5,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(2.0),
//                               child: DropdownButtonHideUnderline(
//                                 child: DropdownButton(
//                                   hint: Text("Select cities"),
//                                   isExpanded: true,
//                                   elevation: 0,
//                                   value: cities,
//                                   icon: Icon(Icons.keyboard_arrow_down,size: 40,),
//                                   items: getCityModel?.data?.map((items) {
//                                     return DropdownMenuItem(
//                                         value: items.id.toString(),
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Text(items.name.toString()),
//                                         )
//                                     );
//                                   }
//                                   ).toList(),
//                                   onChanged: (String? newValue){
//                                     setState(() {
//                                       cities = newValue!;
//                                       print("City iddddd issss ${cities}");
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ),
//                           // TextFormField(
//                           //   controller: addressCtr,
//                           //   decoration: InputDecoration(
//                           //     hintText: 'Enter Address',
//                           //       hintStyle: const TextStyle(
//                           //           fontSize: 15.0, color: colors.secondary),
//                           //     border: OutlineInputBorder(
//                           //       borderRadius: BorderRadius.circular(10)
//                           //     ),
//                           //   ),
//                           //   onTap:(){
//                           //     // PlacePicker(
//                           //     //   apiKey: Platform.isAndroid
//                           //     //       ? "AIzaSyBRnd5Bpqec-SYN-wAYFECRw3OHd4vkfSA"
//                           //     //       : "AIzaSyBRnd5Bpqec-SYN-wAYFECRw3OHd4vkfSA",
//                           //     //   onPlacePicked: (result) {
//                           //     //     print(result.formattedAddress);
//                           //     //     setState(() {
//                           //     //       addressCtr.text = result.formattedAddress.toString();
//                           //     //       pickLat = result.geometry!.location.lat;
//                           //     //       pickLong = result.geometry!.location.lng;
//                           //     //     });
//                           //     //     Navigator.of(context).pop();
//                           //     //     // distnce();
//                           //     //   },
//                           //     //   initialPosition: LatLng(currentLocation!.latitude, currentLocation!.longitude),
//                           //     //   useCurrentLocation: true,
//                           //     // );
//                           //     _getLocation();
//                           //   },
//                           // ),
//                           SizedBox(height: 50),
//                           Center(
//                             child: Btn(
//                                 height: 50,
//                                 width: 320,
//                                 title:
//                                     isLoading ? "Please wait......" : 'Submit',
//                                 color: colors.secondary,
//                                 onPress: () {
//                                   if (_formKey.currentState!.validate()) {
//                                     registrationApi();
//                                   } else {
//                                     const snackBar = SnackBar(
//                                       content: Text('All Fields are required!'),
//                                     );
//                                     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                                     //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
//                                   }
//                                 }),
//                           ),
//                         ],
//                     ),
//                 ),
//             ),
//         ),
//     );
//   }
//
//
//   Widget getNoItem(BuildContext context) {
//     return Center(child: Text("No Itam"));
//   }
//
//   _getLocation() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => PlacePicker(
//           "AIzaSyBRnd5Bpqec-SYN-wAYFECRw3OHd4vkfSA",
//         )));
//     print(
//         "checking adderss detail ${result.country!.name.toString()} and ${result.locality.toString()} and ${result.country!.shortName.toString()} and ${result.postalCode.toString()} ");
//     currentLocationController.text = result.postalCode.toString();
//     print("this is a pincode==========>${currentLocationController.text}");
//     prefs.setString('postalCode1', currentLocationController.text);
//     setState(() {
//       currentLocationController.text = result.formattedAddress.toString();
//       var lat = result.latLng!.latitude;
//       var long = result.latLng!.longitude;
//       print("lat long here ${lat} ${long}");
//     });
//   }
// }

import 'dart:convert';
import 'dart:io';
import 'package:doctorapp/AuthenticationView/LoginScreen.dart';
import 'package:doctorapp/Helper/Color.dart';
import 'package:doctorapp/New_model/GetCityModel.dart';
import 'package:doctorapp/New_model/registration_model2.dart';
import 'package:doctorapp/api/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:place_picker/entities/location_result.dart';
import 'package:place_picker/widgets/place_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Helper/AppBtn.dart';
import '../Helper/Appbar.dart';
import 'package:http/http.dart' as http;
import '../New_model/GetStateModel.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController currentLocationController = TextEditingController();
  TextEditingController addressCtr = TextEditingController();

  bool isLoading = false;
  File? imageFile;
  Position? currentLocation;
  File? newImageFile;
  double pickLat = 0;
  double pickLong = 0;
  String? stateId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getState();
    // Future.delayed(Duration(milliseconds: 400),(){
    //   return addCities();
    // });
  }

  String? cuooooo;
  getCity_id() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('citi', "${cities}");
    print("citiescitiescitiescitiescities ${cities}");
  }

  RegistrationModel2? detailsData;
  registrationApi() async {
    setState(() {
      isLoading == true;
    });
    var headers = {
      'Cookie': 'ci_session=dd50c278f09355c16fbac67ed21dae08884302f4'
    };
    var request =
    http.MultipartRequest('POST', Uri.parse('${ApiService.userRegister}'));
    request.fields.addAll({
      'name': nameController.text,
      'email': emailController.text,
      'mobile': mobileController.text,
      'address': "Indore",
      'city_id': cities.toString(),
      'lat': "",
      'lng': "",
    });
    print('____request.fields${request.fields}_________');

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print("Apiiiii workinggggg");
      var result = await response.stream.bytesToString();
      var finalResult = jsonDecode(result);
      getCity_id();
      Fluttertoast.showToast(msg: "User Registered Successfully");
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => LoginScreen(cityId: cities)));
      setState(() {
        isLoading = false;
      });
      nameController.clear();
      emailController.clear();
      mobileController.clear();
    } else {
      setState(() {
        isLoading = false;
      });
      print(response.reasonPhrase);
    }
  }

  GetCityModel? getCityModel;
  String? city_id;

  addCities() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("Addd city Apiiii");
    var headers = {
      'Cookie': 'ci_session=47a33758cb5f8f90b12340c2f31188b7fc5f9f92'
    };

    var request =
    http.MultipartRequest('POST', Uri.parse('${ApiService.getcitylist}'));
    request.fields.addAll({'state_id': '${states}'});
    print('Request---------------${request.fields}');
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = GetCityModel.fromJson(json.decode(finalResponse));
      String city_id = jsonResponse!.data![0].id ?? "";
      preferences.setString("city_id", city_id);
      print("city id herre ${city_id}");
      setState(() {
        getCityModel = jsonResponse;
      });
      // print("City Herererre ${getCityModel!.data![0].name}");
    } else {
      print(response.reasonPhrase);
    }
  }

  GetStateModel? getStateModel;
  getState() async {
    var headers = {
      'Cookie': 'ci_session=d01e57d25f187766341c297a71e6a3ab1679cf1e'
    };
    var request =
    http.MultipartRequest('POST', Uri.parse('${ApiService.getStates}'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var Result = await response.stream.bytesToString();
      final finalResult = GetStateModel.fromJson(json.decode(Result));
      setState(() {
        getStateModel = finalResult;
        for (var i = 0; i < getStateModel!.data!.length; i++) {
          stateId = getStateModel?.data?[i].id;
          print('---------states----id${stateId}');
        }
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  String? cities;
  String? states;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: customAppBar(text: "Sign Up", isTrue: true, context: context),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/splash/loginback.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 80,),
              const Text("SignUp", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Color(0xffDEBA54)),),
              // SizedBox(height: 40,),
              // Image.asset("assets/splash/splash logo.png", scale: 1.9),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: const [
                              Text(
                                "Name",
                                style: TextStyle(
                                    color: colors.whiteTemp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "*",
                                style: TextStyle(
                                    color: colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10),
                              ),
                            ],
                          )),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        child: TextFormField(
                          style: TextStyle(color: colors.black54),
                          controller: nameController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: 'Enter name',
                              hintStyle: const TextStyle(
                                  fontSize: 15.0, color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                left: 10,
                              )),
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "name is required";
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: const [
                              Text(
                                "Mobile No",
                                style: TextStyle(
                                    color: colors.whiteTemp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "*",
                                style: TextStyle(
                                    color: colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10),
                              ),
                            ],
                          )),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        child: TextFormField(
                          style: const TextStyle(color: colors.black54),
                          controller: mobileController,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          decoration: InputDecoration(
                              counterText: "",
                              hintText: 'Enter mobile',
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintStyle:
                              const TextStyle(fontSize: 15.0, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              contentPadding: const EdgeInsets.only(
                                left: 10,
                              )),
                          validator: (v) {
                            if (v!.length < 10) {
                              return "mobile number is required";
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Row(
                            children: const [
                              Text(
                                "Email Id",
                                style: TextStyle(
                                    color: colors.whiteTemp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "*",
                                style: TextStyle(
                                    color: colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10),
                              ),
                            ],
                          )),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        child: TextFormField(
                          style: TextStyle(color: colors.black54),
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Enter email',
                              hintStyle: const TextStyle(
                                  fontSize: 15.0, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              contentPadding: const EdgeInsets.only(
                                left: 10,
                              ),
                          ),
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Email is required";
                            }
                            if (!v.contains("@")) {
                              return "Enter Valid Email Id";
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: const [
                            Text(
                              "States",
                              style: TextStyle(
                                  color: colors.whiteTemp, fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "*",
                              style: TextStyle(
                                  color: colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: const Padding(
                                padding: EdgeInsets.only(left: 7),
                                child: Text("Select State", style: TextStyle(color: Colors.black, fontSize: 15),),
                              ),
                              isExpanded: true,
                              elevation: 0,
                              value: states,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                size: 40,
                                color: Colors.black,
                              ),
                              items: getStateModel?.data?.map((items) {
                                return DropdownMenuItem(
                                    value: items.id.toString(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(items.name.toString()),
                                    ));
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  states = newValue!;
                                  addCities();
                                  print("City iddddd issss $states");
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: const [
                            Text(
                              "Cities",
                              style: TextStyle(
                                  color: colors.whiteTemp, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "*",
                              style: TextStyle(
                                  color: colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: const Padding(
                                padding: EdgeInsets.only(left: 7),
                                child: Text("Select cities", style: TextStyle(color: Colors.black, fontSize: 15),),
                              ),
                              isExpanded: true,
                              elevation: 0,
                              value: cities,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                size: 40,
                                color: Colors.black,
                              ),
                              items: getCityModel?.data?.map((items) {
                                return DropdownMenuItem(
                                    value: items.id.toString(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(items.name.toString()),
                                    ));
                              }).toList(),
                              onChanged: (String? newValue) async {
                                setState(() {
                                  cities = newValue!;
                                  print("City iddddd issss ${cities}");
                                });
                                SharedPreferences pref =
                                await SharedPreferences.getInstance();
                                pref.setString('Selected_city', cities!);
                              },
                            ),
                          ),
                        ),
                      ),
                      // TextFormField(
                      //   controller: addressCtr,
                      //   decoration: InputDecoration(
                      //     hintText: 'Enter Address',
                      //       hintStyle: const TextStyle(
                      //           fontSize: 15.0, color: colors.secondary),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10)
                      //     ),
                      //   ),
                      //   onTap:(){
                      //     // PlacePicker(
                      //     //   apiKey: Platform.isAndroid
                      //     //       ? "AIzaSyBRnd5Bpqec-SYN-wAYFECRw3OHd4vkfSA"
                      //     //       : "AIzaSyBRnd5Bpqec-SYN-wAYFECRw3OHd4vkfSA",
                      //     //   onPlacePicked: (result) {
                      //     //     print(result.formattedAddress);
                      //     //     setState(() {
                      //     //       addressCtr.text = result.formattedAddress.toString();
                      //     //       pickLat = result.geometry!.location.lat;
                      //     //       pickLong = result.geometry!.location.lng;
                      //     //     });
                      //     //     Navigator.of(context).pop();
                      //     //     // distnce();
                      //     //   },
                      //     //   initialPosition: LatLng(currentLocation!.latitude, currentLocation!.longitude),
                      //     //   useCurrentLocation: true,
                      //     // );
                      //     _getLocation();
                      //   },
                      // ),
                      const SizedBox(height: 30),
                      Center(
                        child: Btn(
                            height: 50,
                            width: MediaQuery.of(context).size.width/2,
                            title: isLoading ? "Please wait......" : 'Submit',
                            // color: colors.secondary,
                            onPress: () {
                              if (_formKey.currentState!.validate()) {
                                registrationApi();
                              } else {
                                const snackBar = SnackBar(
                                  content: Text('All Fields are required!'),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                              }
                            }),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "All ready have an account",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                            },
                            child: const Text(
                              "Login", style: TextStyle(
                                color: colors.secondary,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
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

  Widget getNoItem(BuildContext context) {
    return Center(child: Text("No Itam"));
  }

  _getLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PlacePicker(
          "AIzaSyBRnd5Bpqec-SYN-wAYFECRw3OHd4vkfSA",
        )));
    print(
        "checking adderss detail ${result.country!.name.toString()} and ${result.locality.toString()} and ${result.country!.shortName.toString()} and ${result.postalCode.toString()} ");
    currentLocationController.text = result.postalCode.toString();
    print("this is a pincode==========>${currentLocationController.text}");
    prefs.setString('postalCode1', currentLocationController.text);
    setState(() {
      currentLocationController.text = result.formattedAddress.toString();
      var lat = result.latLng!.latitude;
      var long = result.latLng!.longitude;
      print("lat long here $lat $long");
    });
  }
}