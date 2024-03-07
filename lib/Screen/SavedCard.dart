import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Helper/Color.dart';
import '../New_model/SavedCardListModel.dart';
import '../New_model/SavedCardModel.dart';
import '../api/api_services.dart';
import 'Bottom.dart';

class SavedCardScreen extends StatefulWidget {
  const SavedCardScreen({Key? key}) : super(key: key);

  @override
  State<SavedCardScreen> createState() => _SavedCardScreenState();
}

class _SavedCardScreenState extends State<SavedCardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCard();
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    Fluttertoast.showToast(msg: "Card Saved successfully");
    purchaseCard();
    // setState(() {
    //   currentIndex = 2;
    // });
    // purchaseCard();
    //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment cancelled by user");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {}

  SavedCardListModel? savedCardModel;
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
            'https://developmentalphawizz.com/invitation_design/api/user_saved_cards/$userId'));
    // request.fields.addAll({'user_id': '$userId'});
    print("rrrrrr ${request.url}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse =
          SavedCardListModel.fromJson(json.decode(finalResponse));
      print("Get Enquiry**** $jsonResponse");
      setState(() {
        savedCardModel =
            SavedCardListModel.fromJson(json.decode(finalResponse));
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
            bottomRight: Radius.circular(20),
          ),
        ),
        backgroundColor: colors.secondary,
        title: const Text("Save Card"),
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
    return savedCardModel?.status == false
        ? Center(child: const Text("No Card Found"))
        : savedCardModel?.data?.length == null ||
                savedCardModel?.data?.length == ""
            ? const Center(
                child: CircularProgressIndicator(color: colors.secondary),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: savedCardModel?.data?.length,
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

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Atithi',
        // text: 'Example share text',
        // linkUrl: 'https://developmentalphawizz.com/dr_booking/',
        linkUrl: "https://developmentalphawizz.com/invitation_design/",
        chooserTitle: 'Atithi');
  }

  Razorpay? _razorpay;
  int? pricerazorpayy;

  void openCheckout(amount) async {
    double res = double.parse(amount.toString());
    pricerazorpayy = int.parse(res.toStringAsFixed(0)) * 100;
    print("checking razorpay price ${pricerazorpayy.toString()}");
    // Navigator.of(context).pop();
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': "$pricerazorpayy",
      'name': 'Invitation',
      'image': 'assets/images/homeimage.png',
      'description': 'Invitation',
    };
    try {
      _razorpay?.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  String? card_id;

  purchaseCard() async {
    var headers = {
      'Cookie': 'ci_session=094101f2118b81b6d7797c1b01164b0b63d14708'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse(ApiService.purchasepayment));
    request.fields.addAll({
      'id': card_id.toString(),
      'transaction_id': 'rzp_test_1DP5mmOlF5G5ag'
    });
    print("Purchase parameter ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomScreen()));
    } else {
      print(response.reasonPhrase);
    }
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
            (savedCardModel?.data?[i].image?.length ?? 0) >1 ?
            CarouselSlider(
              options: CarouselOptions(
                height: 550.0,
                autoPlay: true,
                aspectRatio: 20 / 9,
                enlargeCenterPage: true,
              ),
              items: savedCardModel?.data?[i].image?.map((String imageUrl) {
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
              height: 500,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.network(
                "${savedCardModel?.data?[i].image?[0]}",
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
                      text: 'Save Card',
                      icon: const Icon(
                        Icons.download,
                        color: colors.secondary,
                      ),
                      onTap: () {
                        setState(() {
                          card_id = savedCardModel?.data?[i].id.toString();
                        });
                        openCheckout(savedCardModel?.data?[i].price);
                        print("cart id iss $card_id===========");
                      }),
                  Column(
                    children: [
                      const Text(
                        "Card Price",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: colors.secondary),
                      ),
                      Text(
                        "₹ ${savedCardModel?.data?[i].price}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: colors.secondary),
                      ),
                    ],
                  ),
                  // templateCardGestures(
                  //     text: 'invite',
                  //     icon: const Icon(Icons.share, color: colors.secondary),
                  //     onTap: () {
                  //       share();
                  //     })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
