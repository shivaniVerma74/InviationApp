import 'dart:convert';

import 'package:doctorapp/Profile/profile_screen.dart';
import 'package:doctorapp/Screen/Faq.dart';
import 'package:doctorapp/Screen/Histroy.dart';
import 'package:doctorapp/Screen/HomeScreen.dart';
import 'package:doctorapp/Screen/NotificationScreen.dart';
import 'package:doctorapp/Screen/WishlistScreen.dart';
import 'package:doctorapp/Screen/vender_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../AuthenticationView/LoginScreen.dart';
import '../Booking/booking_screen.dart';
import '../Helper/Appbar.dart';
import '../Helper/Color.dart';
import '../New_model/getUserProfileModel.dart';
import '../Profile/Update_password.dart';
import '../Static/privacy_Policy.dart';
import '../Static/terms_condition.dart';
import '../SubscriptionPlan/subscription_plan.dart';
import '../api/api_services.dart';
import 'package:http/http.dart' as http;

import 'Demo.dart';
import 'EventsForm.dart';
import 'ExampleScreen.dart';
import 'MyCardTemplate.dart';
import 'MyEnquiry.dart';
import 'MyTemplate.dart';
import 'NewScreen.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key, this.cityId});
  final cityId;

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  int currentindex = 0;
  List<Widget> pages1 = <Widget>[
    const HomeScreen(),
    const MyCardTemplate(),
    // ProfileScreen(),
    const EventForm(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserProfile();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  GetUserProfileModel? getprofile;
  getuserProfile() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userId = preferences.getString('userId');
    print("getProfile--------------->$userId");
    var headers = {
      'Cookie': 'ci_session=d9075fff59f39b7a82c03ca267be8899c1a9fbf8'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse(ApiService.getUserProfile));
    request.fields.addAll({'id': '$userId'});
    print("getProfile--------------->${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResult = await response.stream.bytesToString();
      final jsonResponse =
          GetUserProfileModel.fromJson(json.decode(finalResult));
      print("this is a ========>profile${jsonResponse}");
      print("emailllllll${getprofile?.data?.first.mobile}");
      setState(() {
        getprofile = jsonResponse;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Confirm Exit"),
                content: const Text("Are you sure you want to exit?"),
                actions: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: colors.secondary),
                    child: const Text("YES"),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: colors.secondary),
                    child: const Text("NO"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: colors.scaffoldBackground,
          key: _scaffoldKey,
          drawer: getDrawer(),
          appBar: AppBar(
            centerTitle: true,

            leading: Container(
              margin: const EdgeInsets.fromLTRB(14,10,5,10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4)
              ),
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                ),
              ),
            ),
            actions:  [
              Container(
                width: 36,
                margin: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)
                ),
                child:
                //Image.asset("assets/home icon/Events.png",color: Colors.black,scale: 3.5,),
                IconButton(
                  icon: const Icon(Icons.notifications, color: Colors.black),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const NotificationScreen()));
                  },
                ),
              ),
            ],
            // backgroundColor: colors.transparent,
            elevation: 0,
            title: Image.asset("assets/images/homeimage.png", height: 60, width: 60,color: Colors.white,),
            flexibleSpace: Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(18),bottomRight: Radius.circular(18),)
          ),
        ),
          ),
          body: Center(
            child: pages1.elementAt(currentindex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: colors.whiteTemp,
            backgroundColor: colors.secondary,
            selectedIconTheme: const IconThemeData(color: colors.black54),
            unselectedIconTheme: const IconThemeData(color: colors.whiteTemp),
            selectedLabelStyle: const TextStyle(color: colors.black54),
            unselectedLabelStyle: const TextStyle(color: colors.whiteTemp),
            //  elevation: 1,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: 'Design',
                icon: Icon(Icons.card_giftcard_outlined,)),
              // BottomNavigationBarItem(label: 'Accessories', icon: Icon(Icons.calendar_today_rounded)),
              BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home,)),
              BottomNavigationBarItem(label: 'Coming Event', icon: Icon(Icons.event)),
            ],
            currentIndex: currentindex,
            selectedItemColor: Colors.black,
            // unselectedItemColor: colors.secondary,
            onTap: _onItemTapped,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            unselectedFontSize: 13,
            selectedFontSize: 13,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Atithi',
        // text: 'Example share text',
        linkUrl: 'https://developmentalphawizz.com/dr_booking/',
        chooserTitle: 'Atithi');
  }

  getDrawer() {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width / 1.3,
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            height: 120,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [colors.secondary, colors.secondary],
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getprofile?.data?.first.profilePic == null || getprofile?.data?.first.profilePic == ""
                    ? const Center(
                        child: CircularProgressIndicator(color: colors.secondary),
                      )
                    : CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          "${getprofile?.data?.first.profilePic}",
                        ),
                      ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${getprofile?.data?.first.username}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 3),
                        ],
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          "${getprofile?.data?.first.email}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.topRight,
          //       end: Alignment.bottomLeft,
          //       colors: [
          //         colors.white10,
          //         colors.primary,
          //       ],
          //     ),
          //   ),
          //   child: ListTile(
          //     leading: Container(
          //       decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.circular(50)),
          //       child: Image.asset(
          //         "assets/images/drawer1.png",
          //         color: colors.black54,
          //         scale: 1.3,
          //         height: 40,
          //         width: 40,
          //       ),
          //     ),
          //     title: Text(
          //       ' My Profile',
          //     ),
          //     onTap: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (Context) => ProfileScreen()));
          //       // Navigator.push(
          //       //   context,
          //       //   MaterialPageRoute(builder: (context) => HomeScreen()),
          //       // );
          //     },
          //   ),
          // ),
          ListTile(
            leading: Image.asset(
              "assets/images/person.png",
              color: colors.black54,
              height: 40,
              width: 40,
            ),
            title: const Text(
              'Profile',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/home.png",
              color: colors.black54,
              height: 40,
              width: 40,
            ),
            title: const Text(
              'Home',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomScreen()),
              );
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/enquiry.png",
              color: colors.black54,
              height: 40,
              width: 40,
            ),
            title: const Text(
              'My Booking',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyEnquiry()),
              );
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/enquiry.png",
              color: colors.black54,
              height: 40,
              width: 40,
            ),
            title: const Text(
              'Marriage Certificate',
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
              // Fluttertoast.showToast(msg: "Coming Soon");
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/enquiry.png",
              color: colors.black54,
              height: 40,
              width: 40,
            ),
            title: const Text(
              'Marriage Scheme Fund',
            ),
            onTap: () {
              Fluttertoast.showToast(msg: "Coming Soon");
            },
          ),
           ListTile(
            leading: Image.asset(
              "assets/images/Term & Conditions.png",
              height: 40,
              width: 40,
              color: colors.black54,
            ),
            title: const Text(
              'Vendor Registartion',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Vendor_Form()),
              );
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/share.png",
              color: colors.black54,
              height: 40,
              width: 40,
            ),
            title: const Text(
              'Share App',
            ),
            onTap: () {
              share();
            },
          ),
          // ListTile(
          //   leading: Image.asset(
          //     "assets/images/enquiry.png",
          //     color: colors.black54,
          //     height: 40,
          //     width: 40,
          //   ),
          //   title: const Text(
          //     'My Enquiry',
          //   ),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => WeddingCardApp()),
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: Image.asset(
          //     "assets/images/card.png",
          //     color: colors.black54,
          //     height: 40,
          //     width: 40,
          //   ),
          //   title: const Text(
          //     'My Template',
          //   ),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => MyTemplate()),
          //     );
          //   },
          // ),
         // ListTile(
           // leading: Image.asset(
           //   "assets/images/Term & Conditions.png",
            //  height: 40,
             // width: 40,
             // color: colors.black54,
            //),
           // title: const Text(
           //   'Faq',
          //  ),
          //  onTap: () {
            //  Navigator.push(
             //   context,
             //   MaterialPageRoute(builder: (context) => FaqScreen()),
             // );
          //  },
         // ),
          ListTile(
            leading: Image.asset(
              "assets/images/Term & Conditions.png",
              height: 40,
              width: 40,
              color: colors.black54,
            ),
            title: const Text(
              'My Bills',
            ),
            onTap: () {
              Fluttertoast.showToast(msg: "Coming Soon");
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/Term & Conditions.png",
              height: 40,
              width: 40,
              color: colors.black54,
            ),
            title: const Text(
              'Business Card',
            ),
            onTap: () {
              Fluttertoast.showToast(msg: "Coming Soon");
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/Term & Conditions.png",
              height: 40,
              width: 40,
              color: colors.black54,
            ),
            title: const Text(
              'Terms & Conditions',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TermsCondition()),
              );
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/Privacy Policy.png",
              color: colors.black54,
              height: 40,
              width: 40,
            ),
            title: const Text(
              'Privacy Policy',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacyPolicy()),
              );
            },
          ),
          // ListTile(
          //   leading: Image.asset(
          //     "assets/images/share.png",
          //     color: colors.black54,
          //     height: 40,
          //     width: 40,
          //   ),
          //   title: const Text(
          //     'Share App',
          //   ),
          //   onTap: () {
          //     share();
          //   },
          // ),
          // ListTile(
          //   leading: Image.asset(
          //     "assets/images/Change Password.png",
          //     color: colors.black54,
          //     height: 40,
          //     width: 40,
          //   ),
          //   title: Text(
          //     'Change Password',
          //   ),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => UpdatePassword()),
          //     );
          //   },
          // ),
          ListTile(
            leading: Image.asset(
              "assets/images/Sign Out.png",
              color: colors.black54,
              height: 40,
              width: 40,
              //color: Colors.grey.withOpacity(0.8),
            ),
            title: const Text(
              'Sign Out',
            ),
            onTap: () async {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Confirm Sign out"),
                      content:
                          const Text("Are  sure to sign out from app now?"),
                      actions: <Widget>[
                        ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: colors.secondary),
                          child: Text("YES"),
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            setState(() {
                              prefs.clear();
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },
                        ),
                        ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: colors.secondary),
                          child: Text("NO"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}