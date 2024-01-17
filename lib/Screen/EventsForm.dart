import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Helper/Color.dart';
import '../New_model/AllCategoryModel.dart';
import '../api/api_services.dart';
import 'my_Enquiry.dart';

class EventForm extends StatefulWidget {
  const EventForm({Key? key}) : super(key: key);

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  @override
  void initState() {
    super.initState();
    allCategory();
  }

  AllCategoryModel? allCategoriesModel;
  allCategory() async {
    var headers = {
      'Cookie': 'ci_session=967018c55118c57e9b50bc9d10a91f021f6744e1'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiService.categories));
    request.fields.addAll({'cat_type': '1'});
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.2,
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemCount: allCategoriesModel?.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      print('Ssssssss------${allCategoriesModel?.data?[index].temp.toString()}');
                      return Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookingDetails(
                                  model: allCategoriesModel?.data?[index].temp,
                                  ind: index,
                                ),
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            color: colors.whiteTemp,
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      "${allCategoriesModel?.data?[index].img}",
                                      height: 130,
                                      width: double.infinity,
                                    ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("${allCategoriesModel?.data?[index].cName}")
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                ),
             ),
            // getCategories(),
          ],
        ),
      ),
    );
  }

  getCategories() {
    return Container(
      height: MediaQuery.of(context).size.height / 1.2,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: allCategoriesModel?.data?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            print(
                'Ssssss  ------${allCategoriesModel?.data?[index].temp.toString()}');
            return Padding(
              padding: const EdgeInsets.all(0.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingDetails(
                        model: allCategoriesModel?.data?[index].temp,
                        ind: index,
                      ),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                  color: colors.whiteTemp,
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            "${allCategoriesModel?.data?[index].img}",
                            height: 130,
                            width: double.infinity,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Text("${allCategoriesModel?.data?[index].cName}")
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
