import 'package:doctorapp/Helper/Color.dart';
import 'package:doctorapp/Screen/CategoryCardView.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  final String url;
  const WebViewExample({super.key, required this.url});

  @override
  State<WebViewExample> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  int? loadingPercentage;
  late final WebViewController _controller;
//   String kNavigationExamplePage = '''<!DOCTYPE html>
//   <html>
//   <head>
//     <title>WebView Test</title>
//   </head>
//   <body>

//     <script>
//       // Function to send a message to the Flutter app using the 'Toaster' JavaScript channel.
//       function showMessage() {
//         var message = {"code":"PAYMENT_SUCCESS","merchantId":"VOICECLUBONLINE","transactionId":"TXN1689950412867","amount":"100","providerReferenceId":"T2307212011529206276305","param1":"na","param2":"na","param3":"na","param4":"na","param5":"na","param6":"na","param7":"na","param8":"na","param9":"na","param10":"na","param11":"na","param12":"na","param13":"na","param14":"na","param15":"na","param16":"na","param17":"na","param18":"na","param19":"na","param20":"na","checksum":"f7ed2861b078d704c0f512fe96d8fe2ec761ccbb5a8aa4f71c0f2b8c02a01fd1###1"};
//                 Toaster.postMessage(JSON.stringify(message));

//       }
//       showMessage()
//     </script>
//   </body>
//   </html>
// ''';
  @override
  void initState() {
    super.initState();
    // final String contentBase64 = base64Encode(
    //   const Utf8Encoder().convert(kNavigationExamplePage),
    // );
    // #docregion platform_features
    // late final PlatformWebViewControllerCreationParams params;
    // params = const PlatformWebViewControllerCreationParams();
    //
    // final WebViewController controller =
    // WebViewController.fromPlatformCreationParams(params);
    // // #enddocregion platform_features
    //
    // controller
    //      ..javascriptMode(javaScriptMode.unrestricted)
    //   ..setNavigationDelegate(
    //     NavigationDelegate(
    //       onProgress: (int progress) {
    //         debugPrint('WebView is loading (progress : $progress%)');
    //       },
    //       onPageStarted: (String url) {
    //         debugPrint('Page started loading: $url');
    //       },
    //       onPageFinished: (String url) {
    //         debugPrint('Page finished loading: $url');
    //         if(url.contains("phonepay_success")){
    //           Navigator.pop(context, url);
    //         }
    //       },
    //       onNavigationRequest: (NavigationRequest request) {
    //         if (request.url.startsWith('https://www.youtube.com/')) {
    //           debugPrint('blocking navigation to ${request.url}');
    //           return NavigationDecision.prevent;
    //         }
    //         debugPrint('allowing navigation to ${request.url}');
    //         return NavigationDecision.navigate;
    //       },
    //       onUrlChange: (UrlChange change) {
    //         debugPrint('url change to ${change.url}');
    //       },
    //     ),
    //   )
    //   ..addJavaScriptChannel(
    //     'Toaster',
    //     onMessageReceived: (JavaScriptMessage message) {
    //       // ScaffoldMessenger.of(context).showSnackBar(
    //       //   SnackBar(content: Text(message.message)),
    //       // );
    //       print("Payment Data${message.message}");
    //       Navigator.pop(context, message.message);
    //     },
    //   )
    //   ..enableZoom(true)
    //   ..loadRequest(Uri.parse(widget.url));
    // // ..loadRequest(Uri.parse("data:text/html;base64,$contentBase64"));
    // _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          // backgroundColor: Colors.white,
          title: const Text('Cards'),
          flexibleSpace: Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
                color: colors.secondary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
          ),
        ),
        backgroundColor: colors.scaffoldBackground,
        body: Stack(
          children: [
            WebView(
              initialUrl: widget.url,
              onPageStarted: (url) {
                setState(() {
                  loadingPercentage = 0;
                });
              },
              onProgress: (progress) {
                setState(() {
                  loadingPercentage = progress;
                });
              },
              onPageFinished: (url) {
                setState(() {
                  loadingPercentage = 100;
                });
              },
              javascriptMode: JavascriptMode.unrestricted,
              // onPageFinished: (String url) {
              //   debugPrint('Page finished loading: $url');
              //   if(url.contains("phonepay_success")){
              //     Navigator.pop(context, url);
              //   }
              // },
            ),
            if (loadingPercentage != null && loadingPercentage! < 100)
              Container(
                color: colors.scaffoldBackground,
                height: double.infinity,
                child: Center(
                  child: CircularProgressIndicator(
                    color: colors.secondary,
                    value: loadingPercentage! / 100,
                  ),
                ),
              ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   heroTag: null,
        //   backgroundColor: colors.secondary,
        //   onPressed: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (context) {
        //       return const CategoryCardView(
        //         imgUrl: "",
        //       );
        //     }));
        //   },
        //   tooltip: "Complete",
        //   child: const Icon(Icons.done),
        // ),
      ),
    );
  }
}
