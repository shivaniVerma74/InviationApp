import 'dart:convert';
import 'package:doctorapp/Helper/Color.dart';
import 'package:doctorapp/Screen/Bottom.dart';
import 'package:doctorapp/Screen/HomeScreen.dart';
import 'package:doctorapp/api/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Helper/AppBtn.dart';
import '../Helper/Appbar.dart';
import 'package:http/http.dart'as http;

class VerifyOtp extends StatefulWidget {
  final OTP;
  final MOBILE;
  final cityId;
  VerifyOtp({Key? key,this.OTP,this.MOBILE,this.cityId}) : super(key: key);
  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  TextEditingController pinController = TextEditingController();

  verifyOtpApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var headers = {
      'Cookie': 'ci_session=1fae43cb24be06ee09e394b6be82b42f6d887269'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiService.verifyOtp}'));
    request.fields.addAll({
      'mobile': widget.MOBILE.toString(),
      'otp': widget.OTP.toString()
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalresponse = await response.stream.bytesToString();
      final jsonresponse = json.decode(finalresponse);
      if (jsonresponse['status']){
        String? otp = jsonresponse['data'][0]["otp"];
        String userId = jsonresponse["data"][0]['id'];
        String mobile = jsonresponse["data"][0]['mobile'];
        preferences.setBool('isLogin', true );
        preferences.setString('userId',userId);
        preferences.setString('userMobile',mobile);
        Fluttertoast.showToast(msg: '${jsonresponse['message']}');
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomScreen(cityId: widget.cityId,)));
      }
      else{
        Fluttertoast.showToast(msg: "${jsonresponse['message']}");
      }
    }
    else {
    print(response.reasonPhrase);
    }
  }

  final defaultPinTheme = PinTheme(
    width: 66,
    height: 60,
    textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: colors.secondary),
      borderRadius: BorderRadius.circular(5),
    ),
  );

    @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(text: "Verification",isTrue: true, context: context),
        backgroundColor: colors.whiteTemp,
        body: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Code has sent to",
                  style: TextStyle(
                      color: colors.blackTemp,
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                ),
                const SizedBox(
                  height: 0,
                ),
                Text(
                  "+91${widget.MOBILE}",
                  style: TextStyle(color:  colors.blackTemp,fontWeight:FontWeight.w500,fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "OTP-${widget.OTP}",
                  style: TextStyle(color:  colors.blackTemp,fontWeight:FontWeight.bold,fontSize: 16),
                ),

                const SizedBox(height: 20,),
                Center(
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Directionality(
                          // Specify direction if desired
                          textDirection: TextDirection.ltr,
                          child: Padding(
                            padding: EdgeInsets.only(left: 40,right: 40),
                            child:Pinput(
                              controller: pinController,
                              defaultPinTheme: defaultPinTheme,
                              // focusedPinTheme: ,
                              // submittedPinTheme: submittedPinTheme,
                              validator: (s) {
                                return s == '${widget.OTP}' ? null : 'Pin is incorrect';
                              },
                              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                              showCursor: true,
                              onCompleted: (pin) => print(pin),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40,),
                const Text("Haven't received the verification code?",style: TextStyle(
                    color: colors.blackTemp,fontSize: 15,fontWeight: FontWeight.bold
                ),),
                const Text("Resend",style: TextStyle(
                    color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17
                ),),
                const SizedBox(
                  height: 60,
                ),
                Btn(
                  color: colors.secondary,
                  height: 45,
                  width: 300,
                  title: 'Submit',
                  onPress: () {
                    // verifyOtp();
                    if(pinController.text== widget.OTP){
                      verifyOtpApi();
                    }else{
                      Fluttertoast.showToast(msg: "Please enter valid otp!");
                    }
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
