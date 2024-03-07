import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../Helper/Color.dart';
import '../New_model/DownloadCardModel.dart';
import '../New_model/SavedCardListModel.dart';
import 'WeddingCardView.dart';

class DownloadCads extends StatefulWidget {
  const DownloadCads({Key? key}) : super(key: key);

  @override
  State<DownloadCads> createState() => _DownloadCadsState();
}

class _DownloadCadsState extends State<DownloadCads> {
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
    print("rrrrrr ${request.url}");
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
          title: const Text('Download Cards'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // const LinearProgressIndicator(valueColor: ,),
              myCard(),
            ],
          ),
        ));
  }

  myCard() {
    return downloadCardModel?.status == false
        ? Center(child: const Text("No Card Found"))
        : downloadCardModel?.data?.length == null ||
                downloadCardModel?.data?.length == ""
            ? const Center(
                child: CircularProgressIndicator(color: colors.secondary),
              )
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

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Atithi',
        // text: 'Example share text',
        // linkUrl: 'https://developmentalphawizz.com/dr_booking/',
        linkUrl: "https://developmentalphawizz.com/invitation_design/",
        chooserTitle: 'Atithi');
  }

  // _share(var kkk) async {
  //   var status = await Permission.photos.request();
  //   // if (/*storagePermission == PermissionStatus.granted*/ status.isGranted) {
  //   final directory = (await getApplicationDocumentsDirectory()).path;
  //   RenderRepaintBoundary bound =
  //   kkk.currentContext?.findRenderObject() as RenderRepaintBoundary;
  //   ui.Image image = await bound.toImage();
  //   ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //   print('${byteData?.buffer.lengthInBytes}_________');
  //   // this will save image screenshot in gallery
  //   if (byteData != null) {
  //     pngBytes = byteData.buffer.asUint8List();
  //     // print(pngBytes);
  //     String fileName = DateTime.now().microsecondsSinceEpoch.toString();
  //     // print(fileName);
  //     final imagePath = await File('$directory/$fileName.png').create();
  //     await imagePath.writeAsBytes(pngBytes!);
  //     Share.shareFiles([imagePath.path]);
  //   }
  //   //}
  //   else if (await status.isDenied) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('This Permission is recommended')));
  //   } else if (await status.isPermanentlyDenied /*storagePermission == PermissionStatus.permanentlyDenied*/) {
  //     openAppSettings().then((value) {});
  //   }
  // }

  GlobalKey keyList = GlobalKey();

   late File myfile;
  Directory? dir;
  downloadPdf( String? urlpdg,String? i) async {
    Dio dio = Dio();
    try {
      var status = await Permission.storage.request();
      if (status.isGranted) {
        String fileName = urlpdg.toString().split('/').last;
        print("FileName: $fileName");
        dir = Directory('/storage/emulated/0/Download/'); // for android
        if (!await dir!.exists()) dir = await getExternalStorageDirectory();
        String path = "${dir?.path}$i$fileName";
        await dio.download(
          urlpdg.toString(),
          path,
          onReceiveProgress: (recivedBytes, totalBytes) {
            print(recivedBytes);
          },
          deleteOnError: true,
        ).then((value) async {
          Fluttertoast.showToast(msg: 'Card Downloaded !');
          // await Share.shareXFiles([myfile(path)], text: fileName);
        });
      } else {
        launch(urlpdg.toString());
      }
    } catch (e, stackTrace) {
      print(stackTrace);
      throw Exception(e);
    }
  }


  downloadFile(String url) async {
    FileDownloader.downloadFile(
        url: url,
        // name: "${filename}",
        onDownloadCompleted: (path) {
          print(path);
          String tempPath = path.toString().replaceAll("Download", "Atithi");
          final File file = File(tempPath);
          print("path here $file");
          var snackBar = const SnackBar(
            backgroundColor: colors.secondary,
            content: Text('Card Download Successfully'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
  }


  Future<void> downloadImage(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    // Get the temporary directory using the path_provider plugin
    final directory = await getTemporaryDirectory();
    final imageFile = File('${directory.path}/image_${DateTime.now().millisecondsSinceEpoch}.png');

    // Write the file
    await imageFile.writeAsBytes(bytes);

    // Show a dialog or any other UI indication that the image has been downloaded
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Image Downloaded'),
          content: Text('Image downloaded successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
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
            GestureDetector(
              onTap: () {
                // _showReligionDialog(context);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const WeddingForm()));
              },
              child: Container(
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
                      text: 'Download Card Now',
                      icon: const Icon(
                        Icons.download,
                        color: colors.secondary,
                      ),
                      onTap: () {
                        print("download image===========");
                        for(int j =0;j<downloadCardModel!.data![i].image!.length;j++) {
                          downloadPdf('${downloadCardModel?.data?[i].image?[j]}',j.toString());
                          print(j.toString());
                        }
                        // _share(keyList);
                        // openCheckout(savedCardModel?.data?[i].price);
                      }),
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
