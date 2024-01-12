import 'dart:convert';

import 'package:doctorapp/Helper/Constant.dart';
import 'package:doctorapp/New_model/AllCategoryModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helper/Color.dart';
import '../New_model/EventListModel.dart';
import '../api/api_services.dart';
import 'package:http/http.dart 'as http;

import 'EnquiryForm.dart';
import 'EventDetails.dart';

class BookingDetails extends StatefulWidget {

   BookingDetails({Key? key, this.ind, this.model}) : super(key: key);
  final model;
  int? ind;
  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    //nearByEvevt();
  }
   AllCategoryModel? eventListModel;
  nearByEvevt() async {
    var headers = {
      'Cookie': 'ci_session=e6545df7c1714023144b9f63cc94cd2118c2e751'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiService.categories}'));
    request.fields.addAll(
        {'cat_type': '1'});
   print("ddddddddddd${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = AllCategoryModel.fromJson(json.decode(finalResponse));
      setState(() {
        eventListModel = jsonResponse;
      });
    } else {
      print(response.reasonPhrase);
    }
  }
  @override
  Widget build(BuildContext context) {
    int? inndx = widget.ind;
    print("ssssssssssssssssssss${widget.model} --------- ${inndx}");
    print("ssssssssssssssssssss${widget.ind}");
    return Scaffold(
        appBar: AppBar(
          title: const Text("Booking"),
          elevation: 0,
          centerTitle: true,
          backgroundColor: colors.primary,
        ),

      body:
      SingleChildScrollView(
        child: Column(
          children: [
            widget.model == null
                ? Center(child: CircularProgressIndicator(color: colors.secondary))
                : InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EnquiryForm()));
              },
                  child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.model.length,
                  // scrollDirection: Axis.vertical,
                  // physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    print('widget.model name ${widget.model[index].uname} ${widget.model.length}');
                    print('widget.model email ${widget.model[index].email}');
                    print('widget.model email ${widget.model[index].email}');
                    return InkWell(
                      child: Card(
                        margin: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 5.0,
                        child: Container(
                          height: MediaQuery.of(context).size.width / 3,
                          child: Row(
                            children: [

                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(10)),
                                  height: 140,
                                  width: 120,
                                  child:
                                  Image.network(
                                      "${widget.model[index].profileImage ?? ''}")),
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
                                            textAlign: TextAlign.right,style: TextStyle(color: colors.blackTemp,fontWeight: FontWeight.bold),),
                                        SizedBox(width: 3),
                                        Container(
                                            width: 80,
                                            child: Text(
                                                "${widget.model[index].uname}",
                                                overflow:
                                                TextOverflow.ellipsis)),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        const Text("City:",
                                            textAlign: TextAlign.right,style: TextStyle(color: colors.blackTemp,fontWeight: FontWeight.bold)),
                                        SizedBox(width: 3),
                                        Container(
                                          width: 170,

                                          child: Text(
                                              "${widget.model[index].address}",overflow: TextOverflow.ellipsis,),
                                        ),
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
                ),
          ],
        ), ),
    );
  }
}
