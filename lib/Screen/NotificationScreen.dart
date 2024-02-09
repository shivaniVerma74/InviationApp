import 'package:doctorapp/Helper/Color.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0Xff00B5EE),
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
        // backgroundColor: colors.transparent,
        flexibleSpace: Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
              color: colors.secondary,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(18),bottomRight: Radius.circular(18),)
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context,index) {
          return InkWell(
            onTap: () {},
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              color: colors.whiteTemp,
              elevation: 6,
              child:  const SizedBox(
                width: double.infinity,
                height: 80,
                child: Padding(
                   padding: EdgeInsets.all(0.0),
                  child: ListTile(
                      title: Text("Notifications"),
                  subtitle: Text("description"),
                  // leading: Icon(Icons.person,color: colors.secondary,),
                  //   trailing: Icon(Icons.delete,color: colors.secondary,),
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
