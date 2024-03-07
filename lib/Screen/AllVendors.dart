import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Helper/Color.dart';
import '../New_model/GetVendorsModel.dart';
import 'EnquiryForm.dart';

class CategoriesImagesScreen extends StatefulWidget {
  final String? id;
  const CategoriesImagesScreen({Key? key, this.id}) : super(key: key);

  @override
  State<CategoriesImagesScreen> createState() => _CategoriesImagesScreenState();
}

class _CategoriesImagesScreenState extends State<CategoriesImagesScreen> {
  // CategoriesModel? categoriesModel;

  @override
  void initState() {
    super.initState();
    getMyCategories();
  }

  MyCategoriesModel? myCategoriesModel;
  getMyCategories() async {
    print("workingggg===========");
    var headers = {
      'Cookie': 'ci_session=8db25b50dbdde75712f643de35584eeb986aefa5'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://developmentalphawizz.com/invitation_design/api/get_vendors/${widget.id}'));
    print("jkjkjjkj ${Uri.base}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finaResult = jsonDecode(result);
      myCategoriesModel = MyCategoriesModel.fromJson(finaResult);
      print("-------bbbbbbbb---------");
      setState(() {});
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("All Vendors"),
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
      body: myCategoriesModel == null
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: ListView.builder(
                itemCount: myCategoriesModel?.data?.length ?? 0,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EnquiryForm(vendor_Id: myCategoriesModel?.data?[i].id,)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        // color: Colors.white,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.white,
                            border: Border.all(color: colors.secondary,)
                          ),
                          child: Column(
                            children: [
                              Container(
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                    viewportFraction: 1,
                                    height: 150,
                                    // Fixed height for the CarouselSlider
                                    enableInfiniteScroll: true,
                                    autoPlay: true,
                                  ),
                                  items: myCategoriesModel!.data?[i].vendorImages?.map((vendorImage) {
                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: _buildContainer(
                                            context,
                                            vendorImage,
                                          ),
                                        );
                                      }).toList() ??
                                      [],
                                ),
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "Vendor Name :",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    myCategoriesModel!.data?[i].uname ?? "",
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "Address :",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    myCategoriesModel!.data?[i].address ?? "",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }

  Widget _buildContainer(BuildContext context, String? imageUrl) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          height: 130,
          width: 300,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black54, width: 2),
              borderRadius: BorderRadius.circular(10)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl ?? "",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
