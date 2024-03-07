import 'dart:convert';

import 'package:doctorapp/Screen/CardWebview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Helper/Color.dart';
import '../New_model/AllCategoryModel.dart';
import '../New_model/AllReligionsModel.dart';
import '../New_model/TemplatesModel.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../api/api_services.dart';

class AllCardsView extends StatefulWidget {
  final String cardName, cat_id, sub_Id;

  const AllCardsView(
      {super.key,
      required this.cardName,
      required this.cat_id,
      required this.sub_Id});

  @override
  State<AllCardsView> createState() => _AllCardsViewState();
}

class _AllCardsViewState extends State<AllCardsView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    getTemplate('');
    allReligions();
    print("sub categoriess${widget.sub_Id}===========");
  }

  bool isTrue = false;
  TemplatesModel? templatesModel;
  getTemplate(sub_cat_Id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("Get service api");
    var headers = {
      'Cookie': 'ci_session=a36a8335f024c7b97f4162931f63227153359896'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://developmentalphawizz.com/invitation_design/api/get_services/${isTrue ? widget.cat_id + "/" + sub_cat_Id : widget.cat_id}'));
    print("get service paremeter $request");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      final jsonResponse = TemplatesModel.fromJson(json.decode(result));
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

  CategoriesData? filterValue;

  AllReligionsModel? religionModel;
  allReligions() async {
    var headers = {
      'Cookie': 'ci_session=58ef3e6d95ad33292b47954b1eee0a91c4032915'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://developmentalphawizz.com/invitation_design/api/get_scat_by_cat'));
    request.fields.addAll({'cat_id': widget.cat_id});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      final jsonResponse = AllReligionsModel.fromJson(json.decode(result));
      setState(() {
        religionModel = jsonResponse;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  String? userId;
  getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userId = preferences.getString('userId');
    print("user_id is here in all cards$userId");
  }

  List<CategoriesData> filterList = [];
  var sub_cat_Id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldBackground,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        backgroundColor: colors.secondary,
        title: Text(widget.cardName),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Column(
          children: [
            widget.sub_Id == "3"
                ? Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton(
                      isExpanded: true,
                      value: filterValue,
                      hint: const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text('Select Religion'),
                      ),
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),
                      // Array list of items
                      items: religionModel?.categories?.map((items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child:
                                Container(child: Text(items.cName.toString())),
                          ),
                        );
                      }).toList(),
                      onChanged: (CategoriesData? value) {
                        setState(() {
                          // filterValue = null;
                          filterValue = value!;
                          sub_cat_Id = value.id.toString();
                          print("filter id is $sub_cat_Id");
                          setState(() {
                            isTrue = true;
                          });
                          getTemplate(sub_cat_Id);
                        });
                      },
                      underline: Container(),
                    ),
                  )
                : const SizedBox(),
            Flexible(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 4,
                    childAspectRatio: 0.6,
                  ),
                  itemCount: templatesModel?.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return WebViewExample(
                              url:
                                  "${templatesModel?.data?[index].image}?price=${templatesModel?.data?[index].price.toString()}&user_id=${userId.toString()}");
                        }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: colors.black12,
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(1, 2),
                              ),
                            ],
                          ),
                          child: Image.network(
                            "${templatesModel?.data?[index].preview}",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
