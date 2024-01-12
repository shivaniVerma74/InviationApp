import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;
import 'package:pdf/widgets.dart' as pw;
import 'package:http/http.dart'as http;
import '../Helper/Color.dart';
import '../api/api_services.dart';

Uint8List? pngBytes;

class WeddingCardView extends StatefulWidget {
  final Uint8List image;
  final Uint8List image2;
  final Uint8List image3;

  const WeddingCardView({Key? key, required this.image, required this.image2, required this.image3}) : super(key: key);

  @override
  State<WeddingCardView> createState() => _WeddingCardViewState();
}

GlobalKey keyList = GlobalKey();
GlobalKey keyList2 = GlobalKey();
GlobalKey keyList3 = GlobalKey();


class _WeddingCardViewState extends State<WeddingCardView> {

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  final picker = ImagePicker();
  final pdf = pw.Document();
  List<File> _image = [];


  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    Fluttertoast.showToast(msg: "Card added successfully");
    purchaseCard();
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment cancelled by user");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
  }

  bool areTextFieldsVisible = false;

  purchaseCard() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.getString("card_id");
    // print("Purchase Paymnet Apiiii ${card_id}");
    var headers = {
      'Cookie': 'ci_session=094101f2118b81b6d7797c1b01164b0b63d14708'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiService.purchasepayment}'));
    request.fields.addAll({
      'id': '1',
      'transaction_id': 'rzp_test_1DP5mmOlF5G5ag'
    });
    print("Purchase parameter ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      setState(() {
        areTextFieldsVisible = true;
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }



  getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image.add(File(pickedFile.path));
      } else {
        print('No image selected');
      }
    });
  }

  createPDF() async {
    for (var img in _image) {
      final image = pw.MemoryImage(img.readAsBytesSync());
      pdf.addPage(pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context contex) {
            return pw.Center(child: pw.Image(image));
          }));
    }
  }

  savePDF() async {
    try {
      final dir = await getExternalStorageDirectory();
      final file = File('${dir?.path}/rajneesh.pdf');
      print("${file}=======================");
      await file.writeAsBytes(await pdf.save());
      showPrintedMessage('success', 'saved to documents');
    } catch (e) {
      showPrintedMessage('error', e.toString());
    }
  }

  showPrintedMessage(String title, String msg) {
    Fluttertoast.showToast(msg: msg,);
    // Flushbar(
    //   title: title,
    //   message: msg,
    //   duration: Duration(seconds: 3),
    //   icon: Icon(
    //     Icons.info,
    //     color: Colors.blue,
    //   ),
    // )..show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colors.secondary,
        title: Text("Wedding Cards"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onLongPress: () {
                _share(keyList);
              },
              child: RepaintBoundary(
                key: keyList,
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    image: DecorationImage(
                      image: MemoryImage(widget.image2),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            InkWell(
              onLongPress:() {
                _share(keyList2);
              },
              child: RepaintBoundary(
                key: keyList2,
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    image: DecorationImage(
                      image: MemoryImage(widget.image3),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            InkWell(
              onLongPress: () {
                // _share(keyList3);

              },
              child: RepaintBoundary(
                key: keyList3,
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    image: DecorationImage(
                      image: MemoryImage(widget.image),
                    ),
                  ),
                ),
              ),
            ),
            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(backgroundColor: colors.primary
            //     ),
            //     onPressed: () {
            //       getImageFromGallery();
            //       // _share(keyList2);
            //     },
            //     child: Text("Save Image")),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: colors.secondary
                ),
                onPressed: () async {
                  // createPDF();
                  // savePDF();
                  saveImage(widget.image,"groom");
                  saveImage(widget.image2,"bride");
                  saveImage(widget.image3,"Program");
                  // _saveImage(pngBytes!);
                  ///For Check Permission
                  /// final directory = (await getApplicationDocumentsDirectory()).path;
                  // RenderRepaintBoundary bound = keyList2.currentContext?.findRenderObject() as RenderRepaintBoundary;
                  // ui.Image image = await bound.toImage();
                  // ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
                  // print('${byteData?.buffer.lengthInBytes}_________');
                  // downloadImage(widget.image2);
                },
                child: Text("Download")),
          ],
        ),
      ),
    );
  }


  Future<String> downloadImage(Uint8List bytes) async {
    final name = "Save Image";
    final result = await ImageGallerySaver.saveImage(widget.image2, name: name);
    return result['filePath'];
  }

  _share(var kkk) async {
    var status = await Permission.photos.request();
    // if (/*storagePermission == PermissionStatus.granted*/ status.isGranted) {
    final directory = (await getApplicationDocumentsDirectory()).path;
    RenderRepaintBoundary bound =
    kkk.currentContext?.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await bound.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    print('${byteData?.buffer.lengthInBytes}_________');
    // this will save image screenshot in gallery
    if (byteData != null) {
      pngBytes = byteData.buffer.asUint8List();
      // print(pngBytes);
      String fileName = DateTime.now().microsecondsSinceEpoch.toString();
      // print(fileName);
      final imagePath = await File('$directory/$fileName.png').create();
      await imagePath.writeAsBytes(pngBytes!);
      Share.shareFiles([imagePath.path]);
    }
    //}
    else if (await status.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('This Permission is recommended')));
    } else if (await status.isPermanentlyDenied /*storagePermission == PermissionStatus.permanentlyDenied*/) {
      openAppSettings().then((value) {});
    }
  }

  Future<void> _saveImage(Uint8List pngBytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/captured_image.png';
    File file = File(filePath);
    await file.writeAsBytes(pngBytes);
  }

  GlobalKey keyList = GlobalKey();

  Future<ui.Image?> captureImage() async {
    try {
      RenderRepaintBoundary boundary = keyList.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      return image;
    } catch (exception) {
      print(exception);
      return null;
    }
  }

  Razorpay? _razorpay;
  int? pricerazorpayy;

  void openCheckout(amount) async {
    double res = double.parse(amount.toString());
    // Navigator.of(context).pop();
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': "${100}",
      'name': 'Invitation',
      'image':'assets/images/homeimage.png',
      'description': 'Invitation',
    };
    try {
      _razorpay?.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }


  Future<String> saveImage(Uint8List bytes,String name) async {
    // String name="${name}";
    final result=await ImageGallerySaver.saveImage(bytes,name: name);
    Fluttertoast.showToast(msg: "image downloaded",);
    return result['filePath'];
  }



  downloadFile2() async {
    var time=DateTime.now().millisecondsSinceEpoch;
    var path="/storage/emulated/0/Downloaded/image-$time.jpg";
    var file=File(path);
    var res=await get(Uri.parse("https://source.unsplash.com/random"));
    file.writeAsBytes(res.bodyBytes);
  }
}
