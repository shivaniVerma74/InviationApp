import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Helper/Color.dart';
import '../New_model/DownloadCardModel.dart';

class InviteScreen extends StatefulWidget {
  const InviteScreen({Key? key}) : super(key: key);

  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCard();
  }

  DownloadCardModel? downloadCardModel;
  getCard() async {
    print("Get carddddddd Apiiiiii");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userId = preferences.getString('userId');
    var headers = {
      'Cookie': 'ci_session=de18d172f08f4702a5883be1ed7a82cdccd37f64'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://developmentalphawizz.com/invitation_design/api/user_downloaded_cards/$userId'));
    // request.fields.addAll({'user_id': '$userId'});
    print("Invite ${request.url}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse =
          DownloadCardModel.fromJson(json.decode(finalResponse));
      setState(() {
        downloadCardModel =
            DownloadCardModel.fromJson(json.decode(finalResponse));
      });
      // print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

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
        title: const Text("Invite"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            myCard(),
          ],
        ),
      ),
    );
  }

  myCard() {
    return downloadCardModel?.status == false
        ? Center(child:  Text("No Card Found"))
        : downloadCardModel?.data?.length == null || downloadCardModel?.data?.length == ""
            ? const Center(child: CircularProgressIndicator(color: colors.secondary),)
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: downloadCardModel?.data?.length,
                itemBuilder: (context, i) {
                  return templateCard1(i);
                });
  }

  templateCardGestures({String? text, Icon? icon, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          icon!,
          const SizedBox(
            height: 2,
          ),
          Text(
            text!,
            style: const TextStyle(color: colors.secondary, fontSize: 16),
          )
        ],
      ),
    );
  }

  Future<void> share(String? url) async {
    await FlutterShare.share(
        title: 'Atithi',
        // text: 'Example share text',
        // linkUrl: 'https://developmentalphawizz.com/dr_booking/',
        linkUrl: "$url",
        chooserTitle: 'Atithi');
  }

  templateCard1(int i) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(colors: [
              Colors.white.withOpacity(0.05),
              Colors.white.withOpacity(0.1),
              Colors.white.withOpacity(0.05)
            ])),
        child: Column(
          children: [
            (downloadCardModel?.data?[i].image?.length ?? 0) > 1 ?
            CarouselSlider(
              options: CarouselOptions(
                height: 470.0,
                autoPlay: true,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
              ),
              items: downloadCardModel?.data?[i].image?.map((String imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ):
            Container(
              clipBehavior: Clip.hardEdge,
              width: double.infinity,
              height: 580,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.network(
                "${downloadCardModel?.data?[i].image?[0]}",
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  templateCardGestures(
                      text: 'invite To Anyone',
                      icon: const Icon(Icons.share, color: colors.secondary),
                      onTap: () {
                        share(downloadCardModel?.data?[i].image?[i].toString());
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
