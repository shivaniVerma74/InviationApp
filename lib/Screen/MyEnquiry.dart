import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Helper/Color.dart';
import '../Helper/Constant.dart';
import '../New_model/GetEnquiryModel.dart';
import '../api/api_services.dart';

class MyEnquiry extends StatefulWidget {
  final MOBILE;
  MyEnquiry({Key? key, this.MOBILE}) : super(key: key);

  @override
  State<MyEnquiry> createState() => _MyEnquiryState();
}

class _MyEnquiryState extends State<MyEnquiry> {

  Future<Null> refreshFunction()async{
    await  _getEnquiry();
  }
  @override
  void initState() {
    super.initState();
    _getEnquiry();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("My Booking"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: colors.whiteTemp,
        flexibleSpace: Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
              color: colors.secondary,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),)
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: refreshFunction,
          child: getEnquiryModel?.status == false ? Center(child: Text("No Booking Found", style: TextStyle(fontSize: 15, color: Colors.black),),):
          Column(
            children: [
              const SizedBox(height: 10),
              getEnquiryModel == null ? const Center(
                  child: CircularProgressIndicator(color: colors.primary)
              ):
              Container(
                height: MediaQuery.of(context).size.height/1.1,
                child: ListView.builder(
                    // shrinkWrap: true,
                    itemCount: getEnquiryModel?.data?.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return
                        Card(
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
                                    height: 150,
                                    width: MediaQuery.of(context).size.width,
                                    child:
                                    // Image.asset('assets/images/img.png'),
                                    Image.network("${ApiService.imageUrl}${getEnquiryModel?.data?[index].profileImage}", fit: BoxFit.fill,),
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
          ),
        ),
      ),
    );
  }
}
