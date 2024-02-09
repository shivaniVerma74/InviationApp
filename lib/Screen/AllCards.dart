import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Helper/Color.dart';
import '../New_model/TemplatesModel.dart';
import '../api/api_services.dart';

class AllCards extends StatefulWidget {
  const AllCards({Key? key}) : super(key: key);

  @override
  State<AllCards> createState() => _AllCardsState();
}

class _AllCardsState extends State<AllCards> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTemplate();
  }

  TemplatesModel? templatesModel;
  getTemplate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("Get Template Apiiii");
    var headers = {
      'Cookie': 'ci_session=a36a8335f024c7b97f4162931f63227153359896'
    };
    var request =
    http.MultipartRequest('POST', Uri.parse(ApiService.getservices));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      final jsonResponse = TemplatesModel.fromJson(json.decode(result));
      String? template_id = jsonResponse.data?.first.id ?? "";
      preferences.setString("template_id", template_id);
      print("Temaplteeee Idddd in home pagee $template_id");
      if (jsonResponse.responseCode == "1") {}
      setState(() {
        templatesModel = jsonResponse;
      });
      // templateView();
    } else {
      print(response.reasonPhrase);
    }
  }


  templateView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height/1,
        child: ListView.builder(
          // physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: templatesModel?.data?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => Form_Screen(
                //             image: templatesModel?.data?[index].image,
                //             temp_Id: templatesModel?.data?[index].id)));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // height: 198,
                    child: Image.network(
                        "${templatesModel?.data?[index].preview}",
                        fit: BoxFit.fill)),
              ),
            );
          },
        ),
      ),
    );
  }

  List<String> statusOptions = [
    "Accept",
    "Unable to Delivered",
    "Door Locked",
    "Will Attempt Again",];

  // Variable to store the selected index
  String? dropdownValue;

  _searchBar() {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: InkWell(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => Search()));
          },
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), border: Border.all(color: Colors.black, width: 1.5),
                color: Theme.of(context).colorScheme.white),
            // padding: EdgeInsets.symmetric(vertical: 8),
            // color: Theme.of(context).colorScheme.white,
            child:
            DropdownButton<String>(
              hint: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("Select Religion"),
              ),
              value: dropdownValue,
              // icon: Padding(
              //   padding: const EdgeInsets.only(right: 20),
              //   child: const Icon(Icons.arrow_downward),
              // ),
              elevation: 16,
              style: const TextStyle(color: Colors.black),

              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: statusOptions.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(fontSize: 13),),
                );
              }).toList(),
            ),
            // const ListTile(

          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.secondary,
        title:const Text("All Cards"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5,),
            _searchBar(),
            SizedBox(height: 10,),
            templateView(),
          ],
        ),
      ),
    );
  }
}
