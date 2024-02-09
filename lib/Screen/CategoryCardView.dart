import 'package:doctorapp/Screen/Bottom.dart';
import 'package:flutter/material.dart';

import '../Helper/Color.dart';

class CategoryCardView extends StatefulWidget {
  final String imgUrl;
  const CategoryCardView({super.key, required this.imgUrl});

  @override
  State<CategoryCardView> createState() => _CategoryCardViewState();
}


class _CategoryCardViewState extends State<CategoryCardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),)
        ),
        backgroundColor: colors.secondary,
        title: const Text('Birthday Card'),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.blueGrey,
            height: double.infinity,
            width: double.infinity,
            // child: Image.network("src",fit: BoxFit.contain,),
          ),
          // Positioned(
          //   bottom: 24,
          //   child: SizedBox(
          //     width: MediaQuery.of(context).size.width,
          //     child: Row(
          //       mainAxisSize: MainAxisSize.max,
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: [
          //         ElevatedButton(
          //             onPressed: (){},
          //             style: ElevatedButton.styleFrom(
          //               backgroundColor: colors.secondary
          //             ),
          //             child: const Text("Edit")),
          //         ElevatedButton(
          //             onPressed: (){},
          //             style: ElevatedButton.styleFrom(
          //                 backgroundColor: colors.secondary
          //             ),
          //             child: const Text("Done")),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
              Navigator.pop(context);
            },
            backgroundColor: colors.secondary,
            tooltip: "Edit Card",
            child: const Icon(Icons.edit),
          ),
          const SizedBox(width: 10,),
          FloatingActionButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const BottomScreen()));
            },
            backgroundColor: colors.secondary,
            tooltip: "Save Card",
            heroTag: null,
            child: const Icon(Icons.save),
          ),
        ],
      )
    );
  }
}
