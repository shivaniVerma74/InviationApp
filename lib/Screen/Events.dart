import 'dart:convert';

import 'package:doctorapp/New_model/EventListModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Helper/Color.dart';
import '../New_model/GetCityModel.dart';
import '../api/api_services.dart';
import 'EventDetails.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100),(){
      return nearByEvevt();
    });
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
      'city_id': "${city_id.toString()}"
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

  Future<Null> refreshFunction()async{
    await nearByEvevt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: colors.primary,
        centerTitle: true,
        elevation: 0,
        title: Text("Events"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5, top: 6),
            child: Icon(Icons.filter_alt),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: refreshFunction,
          child:
          Column(
            children: [
            eventListModel == null ? Center(
            child: CircularProgressIndicator(color: colors.primary,)
            ):
              ListView.builder(
                shrinkWrap: true,
                itemCount: eventListModel?.data?.length,
                  scrollDirection: Axis.vertical,
                  // physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index){
                    return  InkWell(
                      onTap: (){
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
                                Padding(padding: EdgeInsets.all(10)),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 140,
                                  width: 140,
                                  child: Image.network("${eventListModel?.data?[index].profileImage}")
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  alignment: Alignment.topRight,
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(padding: EdgeInsets.only(top: 15)),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Name:",textAlign: TextAlign.right),
                                          SizedBox(width: 3,),
                                          Container(
                                            width: 80,
                                              child: Text("${eventListModel?.data?[index].uname}", overflow: TextOverflow.ellipsis,)),
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
          ),
        ),
      ),
    );
  }
}
