import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctorapp/Helper/Constant.dart';
import 'package:doctorapp/New_model/AllCategoryModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helper/Color.dart';
import '../New_model/EventListModel.dart';
import '../New_model/GetVendorModel.dart';
import '../api/api_services.dart';
import 'package:http/http.dart' as http;

import '../widgets/widgets/commen_slider.dart';
import 'EnquiryForm.dart';
import 'EventDetails.dart';

class BookingDetails extends StatefulWidget {

   BookingDetails({Key? key, this.ind, this.model}) : super(key: key);
 final  List<Temp>? model;
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
    var request = http.MultipartRequest('POST', Uri.parse(ApiService.categories));
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

int _currentPost = 0;

// _CarouselSlider1(index) {
//   return CarouselSlider(
//     options: CarouselOptions(
//         onPageChanged: (index, result) {
//           setState(() {
//             _currentPost = index;
//           });
//         },
//         viewportFraction: 1.0,
//         initialPage: 0,
//         enableInfiniteScroll: true,
//         reverse: false,
//         autoPlay: true,
//         autoPlayInterval: const Duration(seconds: 5),
//         autoPlayAnimationDuration: const Duration(milliseconds: 500),
//         enlargeCenterPage: false,
//         scrollDirection: Axis.horizontal,
//         height: 100.0),
//        items: widget.model[index].profileImage.data?.map((item) {
//       return Card(
//           elevation: 3,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15.0),
//           ),
//           child: CommonSlider(
//             file: item.image ?? '',
//           ));
//     }).toList(),
//   );
// }

  @override
  Widget build(BuildContext context) {
    int? inndx = widget.ind;
    debugPrint("ssssssssssssssssssss${widget.model} --------- ${inndx}");
    debugPrint("ssssssssssssssssssss${widget.ind}");
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),)
          ),
          backgroundColor: colors.secondary,
          title:  const Text("Booking Details"),
        ),
      body:
      SingleChildScrollView(
        child:
        Column(
          children: [
            widget.model == null
                ? Center(child: CircularProgressIndicator(color: colors.secondary))
                : InkWell(
              onTap: () {
              },
                  child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.model?.length,
                  // scrollDirection: Axis.vertical,
                  // physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EnquiryForm(vendor_Id: widget.model?[index].id)));

                      },
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 5.0,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.width / 3,
                          child: Row(
                            children: [

                              Container(
                                padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(10)),
                                  clipBehavior: Clip.hardEdge,
                                  height: 100,
                                  width: 100,
                                  child:
                                  Image.network(
                                      "${widget.model?[index].profileImage ?? ''}",fit: BoxFit.fill,)),
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
                                        const SizedBox(width: 3),
                                        SizedBox(
                                            width: 120,
                                            child: Text(
                                                "${widget.model?[index].uname}",
                                                overflow:
                                                TextOverflow.ellipsis)),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        const Text("City:",
                                            textAlign: TextAlign.right,style: TextStyle(color: colors.blackTemp,fontWeight: FontWeight.bold)),
                                        const SizedBox(width: 3),
                                        SizedBox(
                                          width: 180,
                                          child: Text(
                                              "${widget.model?[index].address}",overflow: TextOverflow.ellipsis,),
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
