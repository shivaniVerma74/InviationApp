import 'dart:convert';
import 'package:doctorapp/Screen/Bottom.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Helper/Color.dart';
import '../New_model/login_response.dart';
import 'Signup.dart';
import '../api/api_services.dart';
import 'VerifyOtp.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key, this.id, this.cityId}) : super(key: key);
  final id;
  final cityId;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _value = 1;
  bool isMobile = false;
  bool isSendOtp = false;
  bool isLoading = false;
  bool isloader = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LogInResponse? logInResponse;

  int selectedIndex = 1;
  bool _isObscure = true;

  loginWithMobileApi() async {
    String? token;
    try {
      token = await FirebaseMessaging.instance.getToken();
      print("-----------token:-----$token");
    } on FirebaseException {
      print('__________FirebaseException_____________');
    }
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('otp', "otp");
    preferences.setString('mobile', "mobile");
    print("this is apiiiiiiii");
    var headers = {
      'Cookie': 'ci_session=3463c437a12b70be3d42ff97fbb888c49cf6887f'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse(ApiService.sendOTP));
    request.fields
        .addAll({'mobile': mobileController.text, 'fcm_id': '$token'});
    print('____request.fields______${request.fields}_________');
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonresponse = json.decode(finalResponse);
      print("this is final responsesssssssssss$finalResponse");
      if (jsonresponse['status'] == true) {
        String otp = jsonresponse['data'][0]['otp'];
        String mobile = jsonresponse['data'][0]['mobile'];
        print('____App_________${mobile}__${otp}___');
        Fluttertoast.showToast(msg: '${jsonresponse['message']}');
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => VerifyOtp(
                      OTP: otp,
                      MOBILE: mobile,
                      cityId: widget.cityId,
                    )));
      } else {
        Fluttertoast.showToast(msg: "${jsonresponse['message']}");
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  bool isLoading1 = false;
  @override
  void initState() {
    FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    _firebaseMessaging.getToken().then((token) {
      print("token is print-------------> $token");
    });
  }

  @override
  Widget build(BuildContext context) {
    print("jnjjnjn${widget.cityId}");
    return SafeArea(
      child: Scaffold(
        //backgroundColor: colors.whiteTemp,
        body: SingleChildScrollView(
          child: Container(
          height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/splash/loginback.png"),
                fit: BoxFit.fill,
              ),
            ),
            child:  Column(
              children: [

                SizedBox(height: 50,),
                const Text("Login", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Color(0xffDEBA54)),),
                SizedBox(height: 40,),
                Image.asset("assets/splash/splash logo.png", scale: 1.9),
                SizedBox(height: 80),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const Padding(
                    //   padding: EdgeInsets.only(left: 20.0),
                    //   child: Text("Login",
                    //     style: TextStyle(
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 25),
                    //   ),
                    // ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            // height: 60,
                            width: MediaQuery.of(context).size.width/1.1,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(15),
                            //   color: colors.whiteTemp,
                            //   //Theme.of(context).colorScheme.gray,
                            // ),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 4,
                              child: Center(
                                child: TextFormField(
                                  controller: mobileController,
                                  keyboardType: TextInputType.number,
                                  maxLength: 10,
                                  validator: (v) {
                                    if (v!.length != 10) {
                                      return "mobile number is required";
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    counterText: "",
                                    contentPadding: EdgeInsets.only(left: 15, top: 15),
                                    hintText: "Mobile Number",
                                    hintStyle: TextStyle(color: Colors.black),
                                    prefixIcon: Icon(Icons.call, color: Colors.black, size: 18),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isLoading = true;
                                });
                                if (mobileController.text.isNotEmpty &&
                                    mobileController.text.length == 10) {
                                  loginWithMobileApi();
                                } else {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Fluttertoast.showToast(msg: "Please enter valid mobile number!");
                                }
                              },
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width/1.7,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: colors.secondary),
                                child:
                                // isloader == true ? Center(child: CircularProgressIndicator(color: Colors.white,),) :
                                const Center(
                                  child: Text("Send OTP", style: TextStyle(fontSize: 18, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 120),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                                },
                                child: const Text(
                                  "SignUp", style: TextStyle(
                                    color: colors.secondary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}