// import 'dart:convert';
// import 'package:doctorapp/New_model/GetSettingModel.dart';
// import 'package:doctorapp/api/api_services.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import '../Helper/Appbar.dart';
// import 'package:http/http.dart'as http;
//
// class TermsCondition extends StatefulWidget {
//   const TermsCondition({Key? key}) : super(key: key);
//
//   @override
//   State<TermsCondition> createState() => _TermsConditionState();
// }
//
// class _TermsConditionState extends State<TermsCondition> {
//
//   @override
//   final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
//   new GlobalKey<RefreshIndicatorState>();
//   Future<Null> _refresh() {
//     return callApi();
//   }
//   Future<Null> callApi() async {
//     getSettingApi();
//   }
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getSettingApi();
//   }
//   GetSettingModel? settingModel;
//   var termsConditions;
//   getSettingApi() async {
//     var headers = {
//       'Cookie': 'ci_session=eb651cdce0850614d296b81363913b2ca08fe641'
//     };
//     var request = http.Request('POST', Uri.parse('${ApiService.getSettings}'));
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//     if (response.statusCode == 200) {
//      final result =  await response.stream.bytesToString();
//      final jsonResponse = json.decode(result);
//      setState(() {
//        termsConditions = jsonResponse['data']['terms_conditions'][0];
//      });
//      // var FinalResult = GetSettingModel.fromJson(jsonDecode(result));
//      // print("thi osoks0  ============>${FinalResult}");
//      // setState(() {
//      //   settingModel = FinalResult;
//      // });
//     }
//     else {
//     print(response.reasonPhrase);
//     }
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: _refresh,
//       child: Scaffold(
//         appBar:  customAppBar(text: "Terms & Condition",isTrue: true, context: context),
//          body: ListView(
//            children: [
//              termsConditions == null || termsConditions == "" ? Center(child: CircularProgressIndicator()):
//              Html(
//                  data: termsConditions
//              )
//            ],
//          )
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
//
// class TextOverImage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Text Over Image Image Example'),
//       ),
//       body: Center(
//         child: Container(
//           height: 300,
//           width: 300,
//           child: Stack(
//             children: <Widget>[
//               Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     color: Colors.blue,
//                     image: DecorationImage(
//                         image: new NetworkImage(
//                             "https://thumbs.dreamstime.com/b/funny-face-baby-27701492.jpg"),
//                         fit: BoxFit.fill)),
//               ),
//               HomePage()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   Offset offset = Offset.zero;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Positioned(
//         left: offset.dx,
//         top: offset.dy,
//         child: GestureDetector(
//             onPanUpdate: (details) {
//               setState(() {
//                 offset = Offset(
//                     offset.dx + details.delta.dx, offset.dy + details.delta.dy);
//               });
//             },
//             child: const SizedBox(
//               width: 300,
//               height: 300,
//               child: Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Center(
//                   child: Text("You Think You Are Funny But You Are Not",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 28.0,
//                           color: Colors.red)),
//                 ),
//               ),
//             ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

class DragAndDropExample extends StatefulWidget {
  @override
  _DragAndDropExampleState createState() => _DragAndDropExampleState();
}

class _DragAndDropExampleState extends State<DragAndDropExample> {
  List<String> texts = ['Text 1', 'Text 2', 'Text 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drag and Drop Example'),
      ),
      body: ReorderableListView(
        children: texts.map((text) {
          return ListTile(
            key: ValueKey(text),
            title: Text(text),
          );
        }).toList(),
          onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final text = texts.removeAt(oldIndex);
            texts.insert(newIndex, text);
          });
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(

    title: 'Drag and Drop Example',
    home: DragAndDropExample(),
  ));
}
