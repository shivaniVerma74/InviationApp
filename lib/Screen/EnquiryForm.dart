import 'dart:convert';

import 'package:doctorapp/Screen/Bottom.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Helper/Color.dart';
import '../api/api_services.dart';

class EnquiryForm extends StatefulWidget {
  const EnquiryForm({Key? key}) : super(key: key);

  @override
  State<EnquiryForm> createState() => _EnquiryFormState();
}

class _EnquiryFormState extends State<EnquiryForm> {
  TextEditingController namectr = TextEditingController();
  TextEditingController mobileCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController messageCtr = TextEditingController();

  bool load = false;
  enquirySend() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userId = preferences.getString('userId');
    String? vendor_id = preferences.getString("vendor_id");
    print("Enquiry Sumbit Successfullyyyyyyy");
    var headers = {
      'Cookie': 'ci_session=88d269d5bf30ff6f1a646d5b9653424dd6bc7552'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiService.submitquery}'));
    request.fields.addAll({
      'name': namectr.text,
      'user_id': '$userId',
      'mobile': mobileCtr.text,
      'email': emailCtr.text,
      'message': messageCtr.text,
      'vendor_id': '${vendor_id.toString()}'
    });
    print("Enquiry Formmm parameter${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResponse);
      if (jsonResponse['status'] == true) {
        Fluttertoast.showToast(msg: '${jsonResponse['message']}');
        // Navigator.pop(context);
        setState(() {
          load = true;
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) => BottomScreen()));
      } else {
        Fluttertoast.showToast(msg: "${jsonResponse['message']}");
      }
    } else {
      setState(() {});
      print(response.reasonPhrase);
    }
  }

  final _formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),)
        ),
        backgroundColor: colors.secondary,
        title:  const Text("Enquiry Form"),
      ),
        body:SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                borderOnForeground: true,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height/1.5,
                  width: MediaQuery.of(context).size.width/1,
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: namectr,
                              decoration: InputDecoration(
                                  hintText: "Name",
                                  prefixIcon: const Icon(Icons.person),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))
                              ),
                              validator: (value){
                                if(value==null||value.isEmpty) {
                                  return "Please Enter name";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              maxLength: 10,
                              keyboardType: TextInputType.number,
                              controller: mobileCtr,
                              decoration: InputDecoration(
                                  hintText: "Mobile",
                                  prefixIcon: const Icon(Icons.phone),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))
                              ),
                              validator: (value){
                                if(value==null||value.isEmpty) {
                                  return "Please Enter mobile";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15,),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailCtr,
                              decoration: InputDecoration(
                                  hintText: "Email",
                                  prefixIcon: const Icon(Icons.email),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))
                              ),
                              validator: (value){
                                if(value==null||value.isEmpty) {
                                  return "Please Enter mail";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              controller: messageCtr,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "Message",
                                prefixIcon: Icon(Icons.inbox),
                              ),
                              validator: (value){
                                if(value==null||value.isEmpty) {
                                  return "Please Enter message";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width/1.3,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: colors.secondary),
                                  onPressed: (){
                                    if (_formKey.currentState!.validate()) {
                                      enquirySend();
                                    } else {
                                      Fluttertoast.showToast(msg: "Pls fill all fields");
                                    }
                                  },
                                  child: const Text("Submit")
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
