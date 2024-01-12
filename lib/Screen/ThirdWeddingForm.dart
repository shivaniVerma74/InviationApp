import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Helper/Color.dart';
import 'WeddingCardScreen.dart';

class ThirdWeddingForm extends StatefulWidget {
  String? programName;
  final String? groomName;
  final String? brideName;
  String? venueName;
  String? Date;
  String? Time;
  String? secondPrograme;
  String? secondVenue;
  String? secondDate;
  String? secondTime;
  String? thirdPrograme;
  String? thirdVenue;
  String? thirdDate;
  String? thirdTime;
  ThirdWeddingForm({Key? key, this.Date, this.secondDate, this.secondVenue, this.thirdDate, this.programName, this.secondPrograme, this.secondTime, this.thirdPrograme,
  this.thirdTime, this.thirdVenue, this.Time, this.venueName, this.brideName, this.groomName}) : super(key: key);

  @override
  State<ThirdWeddingForm> createState() => _ThirdWeddingFormState();
}

class _ThirdWeddingFormState extends State<ThirdWeddingForm> {


  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  TextEditingController GroomNameController = TextEditingController();
  TextEditingController GfatherNameController = TextEditingController();
  TextEditingController GmotherNameController = TextEditingController();
  TextEditingController BrideNameController = TextEditingController();
  TextEditingController BfatherNameController = TextEditingController();
  TextEditingController BmotherNameController = TextEditingController();
  TextEditingController ProgramNameController = TextEditingController();
  TextEditingController VenueController = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController timecon = TextEditingController();

  TextEditingController secondProgrameCtr = TextEditingController();
  TextEditingController venueCtr = TextEditingController();
  TextEditingController dateCtr = TextEditingController();
  TextEditingController timeCtr = TextEditingController();

  TextEditingController thirdProgrameCtr = TextEditingController();
  TextEditingController venueNameCtr = TextEditingController();
  TextEditingController dateNameCtr = TextEditingController();
  TextEditingController timeNameCtr = TextEditingController();

  String? groomName;
  String? gFatherName;
  String? gMotherName;
  String? brideName;
  String? bFatherName;
  String? bMotherName;

  String? programName;
  String? venue;
  String? Date;
  String? Time;

  String? secondPrograme;
  String? secondVenue;
  String? secondDate;
  String? secondTime;

  String? thirdPrograme;
  String? thirdVenue;
  String? thirdTime;
  String? thirdDate;

  String? selectedDate;
  var selectedTime = TimeOfDay.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.secondary,
        centerTitle: true,
        title: const Text("Wedding Form"),
      ),
      body: SingleChildScrollView(child: Column(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            borderOnForeground: true,
            child: Container(
              height: MediaQuery.of(context).size.height/4,
              width: MediaQuery.of(context).size.width/1,
              decoration: const BoxDecoration(),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 9),
                        // TextFormField(
                        //   controller: BrideNameController,
                        //   decoration: InputDecoration(
                        //       hintText: "Bride Name",
                        //       prefixIcon: const Icon(Icons.person),
                        //       border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(10))),
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty)
                        //       return "Please Enter name";
                        //     return null;
                        //   },
                        // ),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        TextFormField(
                          controller: GfatherNameController,
                          decoration: InputDecoration(
                              hintText: "Groom Father Name",
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Please Enter father name";
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: GmotherNameController,
                          decoration: InputDecoration(
                              hintText: "Groom Mother Name",
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Please Enter mother name";
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          borderOnForeground: true,
          child: Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width / 1,
            decoration: const BoxDecoration(),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Form(
                  key: _formKey2,
                  child: Column(
                    children: [
                      // const Text(
                      //   "Bride Details",
                      //   style: TextStyle(
                      //       fontSize: 14, fontWeight: FontWeight.w500),
                      // ),
                      // const SizedBox(height: 9),
                      // TextFormField(
                      //   controller: BrideNameController,
                      //   decoration: InputDecoration(
                      //       hintText: "Bride Name",
                      //       prefixIcon: const Icon(Icons.person),
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(10))),
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty)
                      //       return "Please Enter name";
                      //     return null;
                      //   },
                      // ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: BfatherNameController,
                        decoration: InputDecoration(
                            hintText: "Father Name",
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Please Enter father name";
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: BmotherNameController,
                        decoration: InputDecoration(
                            hintText: "Mother Name",
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Please Enter mother name";
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
          SizedBox(height: 20,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: colors.secondary),
            onPressed: () {
              groomName = widget.groomName;
              gFatherName = GfatherNameController.text;
              gMotherName = GmotherNameController.text;
              brideName = widget.brideName;
              bFatherName = BfatherNameController.text;
              bMotherName = BmotherNameController.text;
              programName = widget.programName;
              venue = widget.venueName;
              Date = widget.Date;
              Time = widget.Time;

              secondPrograme = widget.secondPrograme;
              secondVenue = widget.secondVenue;
              secondDate = widget.secondDate;
              secondTime = widget.secondTime;

              thirdPrograme = widget.thirdPrograme;
              thirdVenue = widget.thirdVenue;
              thirdDate = widget.thirdDate;
              thirdTime = widget.thirdTime;

              if (_formKey.currentState!.validate() && _formKey2.currentState!.validate()
              // && _formKey3.currentState!.validate()
              ) {
                Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => WeddingCardScreen(
                    brideName: brideName,
                    brideFatherName: bFatherName,
                    brideMotherName: bMotherName,
                    groomFatherName: gFatherName,
                    groomMotherName: gMotherName,
                    groomName: groomName,
                    Date: Date,
                    programName: programName,
                    Time: Time,
                    venueName: venue,
                    secondPrograme: secondPrograme,
                    secondVenue: secondVenue,
                    secondDate: secondDate,
                    secondTime: secondTime,
                    thirdPrograme: thirdPrograme,
                    thirdVenue: thirdVenue,
                    thirdDate: thirdDate,
                    thirdTime: thirdTime,
                  ),
                ),
                );
              }
            },
            // onPressed: () {
            //   groomName = GroomNameController.text;
            //   gFatherName = GfatherNameController.text;
            //   gMotherName = GmotherNameController.text;
            //   brideName = BrideNameController.text;
            //   bFatherName = BfatherNameController.text;
            //   bMotherName = BmotherNameController.text;
            //   programName = ProgramNameController.text;
            //   venue = VenueController.text;
            //   Date = dateinput.text;
            //   Time = timecon.text;
            //
            //   secondPrograme = secondProgrameCtr.text;
            //   secondVenue = venueCtr.text;
            //   secondDate = dateCtr.text;
            //   secondTime = timeCtr.text;
            //
            //   thirdPrograme = thirdProgrameCtr.text;
            //   thirdVenue = venueNameCtr.text;
            //   thirdDate = dateNameCtr.text;
            //   thirdTime = timeNameCtr.text;
            //
            //   if (_formKey.currentState!.validate() &&
            //       _formKey2.currentState!.validate() &&
            //       _formKey3.currentState!.validate()) {
            //     Navigator.push(
            //       context, MaterialPageRoute(
            //         builder: (context) => WeddingCardScreen(
            //           brideName: brideName,
            //           brideFatherName: bFatherName,
            //           brideMotherName: bMotherName,
            //           groomFatherName: gFatherName,
            //           groomMotherName: gMotherName,
            //           groomName: groomName,
            //           Date: Date,
            //           programName: programName,
            //           Time: Time,
            //           venueName: venue,
            //           secondPrograme: secondPrograme,
            //           secondVenue: secondVenue,
            //           secondDate: secondDate,
            //           secondTime: secondTime,
            //           thirdPrograme: thirdPrograme,
            //           thirdVenue: thirdVenue,
            //           thirdDate: thirdDate,
            //           thirdTime: thirdTime,
            //         ),
            //       ),
            //     );
            //   }
            // },
            child: const Text("Submit",),
          ),
         ],
       ),
      ),
    );
  }
}
