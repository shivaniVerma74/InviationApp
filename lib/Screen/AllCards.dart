import 'package:doctorapp/Screen/CardWebview.dart';
import 'package:flutter/material.dart';

import '../Helper/Color.dart';

class AllCardsView extends StatefulWidget {
  final String cardName;
  const AllCardsView({super.key,required this.cardName});

  @override
  State<AllCardsView> createState() => _AllCardsViewState();
}

class _AllCardsViewState extends State<AllCardsView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldBackground,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),)
        ),
        backgroundColor: colors.secondary,
        title:  Text(widget.cardName),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8,8,8,0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 4,
              childAspectRatio: 0.6,
            ),
            itemCount: 10,
            itemBuilder: (_,index){
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return   const WebViewExample(
                        url : "https://developmentalphawizz.com/invitation_design/welcome/wedding_card") ;
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 6),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                       color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: colors.black54,
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(1, 2)
                        )
                      ],
                    ),

                     child: Image.asset("assets/images/weddingtwo.png",fit: BoxFit.fill,),
                  ),
                ),
              );
            }
        ),
      )
    );
  }
}
