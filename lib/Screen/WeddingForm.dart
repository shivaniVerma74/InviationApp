import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Helper/Color.dart';
import 'SecondWeddingForm.dart';
import 'WeddingCardScreen.dart';
// Flutter application gives OOM error and exits #116498

// import '../Helper/Color.dart';
// import 'CardScreen.dart';

class WeddingForm extends StatefulWidget {
  const WeddingForm({Key? key}) : super(key: key);

  @override
  State<WeddingForm> createState() => _WeddingFormState();
}

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

int currStep = 0;
bool isLoading = false;
final _formKey1 = GlobalKey<FormState>();
var selecttimee;

// List<GlobalKey<FormState>> formKeys = [GlobalKey<FormState>(), GlobalKey<FormState>(), GlobalKey<FormState>()];
final _formKey2 = GlobalKey<FormState>();
final _formKey3 = GlobalKey<FormState>();

String? selectedDate;
var selectedTime = TimeOfDay.now();

// List<Widget> cards = [];

class _WeddingFormState extends State<WeddingForm> {
  // void _addCard() {
  //   setState(() {
  //     cards.add(CustomCard()); // Add a new card to the list
  //   });
  // }
  // void _removeCard() {
  //   setState(() {
  //     cards.removeLast(); // Add a new card to the list
  //   });
  // }

  // String? template_id = widget.id;
  @override
  void dispose() {
    // TODO: implement dispose
    GroomNameController.dispose();
    BrideNameController.dispose();
    GfatherNameController.dispose();
    GmotherNameController.dispose();
    BfatherNameController.dispose();
    BmotherNameController.dispose();
    ProgramNameController.dispose();
    VenueController.dispose();
    dateinput.dispose();
    timecon.dispose();
    secondProgrameCtr.dispose();
    venueCtr.dispose();
    dateCtr.dispose();
    timeCtr.dispose();
    thirdProgrameCtr.dispose();
    venueNameCtr.dispose();
    dateNameCtr.dispose();
    timeNameCtr.dispose();
    GfatherNameController.dispose();

    GroomNameController.clear();
    BrideNameController.clear();
    GfatherNameController.clear();
    GmotherNameController.clear();
    BfatherNameController.clear();
    BmotherNameController.clear();
    ProgramNameController.clear();
    VenueController.clear();
    dateinput.clear();
    timecon.clear();
    secondProgrameCtr.clear();
    venueCtr.clear();
    dateCtr.clear();
    timeCtr.clear();
    thirdProgrameCtr.clear();
    venueNameCtr.clear();
    dateNameCtr.clear();
    timeNameCtr.clear();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldBackground,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: colors.transparent,
        centerTitle: true,
        title: const Text("Wedding Form"),
        flexibleSpace: Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
              color: colors.secondary,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(18),bottomRight: Radius.circular(18),)
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              borderOnForeground: true,
              child: Container(
                // height: MediaQuery.of(context).size.height / 2.5,
                // width: MediaQuery.of(context).size.width / 1,
                decoration: const BoxDecoration(),
                child: Center(
                  child: Form(
                    key: _formKey1,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 15, right: 15,),
                      child: Column(
                        children: [
                          const Text(
                            "Groom Details",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: GroomNameController,
                            decoration: InputDecoration(
                                hintText: "Groom Name",
                                prefixIcon: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15,),
                          TextFormField(
                            controller: GfatherNameController,
                            decoration: InputDecoration(
                                hintText: "Groom Father Name",
                                prefixIcon: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter father name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: GmotherNameController,
                            decoration: InputDecoration(
                                hintText: "Groom Mother Name",
                                prefixIcon: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter mother name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          // TextFormField(
                          //   controller: dateinput,
                          //   decoration: InputDecoration(
                          //       prefixIcon: IconButton(
                          //           onPressed: () async {
                          //             DateTime? pickedDate =
                          //                 await showDatePicker(
                          //                     context: context,
                          //                     initialDate: DateTime.now(),
                          //                     firstDate: DateTime(1950),
                          //                     lastDate: DateTime(2100),
                          //                     builder: (context, child) {
                          //                       return Theme(
                          //                           data: Theme.of(context)
                          //                               .copyWith(
                          //                                   colorScheme:
                          //                                       const ColorScheme
                          //                                           .light(
                          //                             primary: colors.primary,
                          //                           )),
                          //                           child: child!);
                          //                     });
                          //             if (pickedDate != null) {
                          //               //pickedDate output format => 2021-03-10 00:00:00.000
                          //               String formattedDate =
                          //                   DateFormat('yyyy-MM-dd')
                          //                       .format(pickedDate);
                          //               //formatted date output using intl package =>  2021-03-16
                          //               setState(() {
                          //                 dateinput.text =
                          //                     formattedDate; //set output date to TextField value.
                          //               });
                          //             }
                          //           },
                          //           icon: const Icon(
                          //               Icons.calendar_today_outlined)),
                          //       hintText: 'dd-mm-yyyy',
                          //       border: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(10))),
                          //   onTap: () async {
                          //     DateTime? pickedDate = await showDatePicker(
                          //         context: context,
                          //         initialDate: DateTime.now(),
                          //         firstDate: DateTime(1950),
                          //         lastDate: DateTime(2100),
                          //         builder: (context, child) {
                          //           return Theme(
                          //               data: Theme.of(context).copyWith(
                          //                 colorScheme: const ColorScheme.light(
                          //                     primary: colors.primary),
                          //               ),
                          //               child: child!);
                          //         });
                          //     if (pickedDate != null) {
                          //       //pickedDate output format => 2021-03-10 00:00:00.000
                          //       String formattedDate =
                          //           DateFormat('yyyy-MM-dd').format(pickedDate);
                          //       //formatted date output using intl package =>  2021-03-16
                          //       setState(() {
                          //         dateinput.text =
                          //             formattedDate; //set output date to TextField value.
                          //       });
                          //     }
                          //   },
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty)
                          //       return "Please Enter Date and time";
                          //     return null;
                          //   },
                          // ),
                          // const SizedBox(
                          //   height: 15,
                          // ),
                          // TextFormField(
                          //   controller: GmotherNameController,
                          //   decoration: InputDecoration(
                          //       hintText: "Mother Name",
                          //       prefixIcon: const Icon(Icons.person),
                          //       border: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(10))),
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty)
                          //       return "Please Enter mother name";
                          //     return null;
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Card(
            //   margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            //   elevation: 5.0,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   borderOnForeground: true,
            //   child: Container(
            //     height: MediaQuery.of(context).size.height / 2.3,
            //     width: MediaQuery.of(context).size.width / 1,
            //     decoration: const BoxDecoration(),
            //     child: Center(
            //       child: Padding(
            //         padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            //         child: Form(
            //           key: _formKey2,
            //           child: Column(
            //             children: [
            //               const Text(
            //                 "Bride Details",
            //                 style: TextStyle(
            //                     fontSize: 14, fontWeight: FontWeight.w500),
            //               ),
            //               const SizedBox(height: 9),
            //               TextFormField(
            //                 controller: BrideNameController,
            //                 decoration: InputDecoration(
            //                     hintText: "Bride Name",
            //                     prefixIcon: const Icon(Icons.person),
            //                     border: OutlineInputBorder(
            //                         borderRadius: BorderRadius.circular(10))),
            //                 validator: (value) {
            //                   if (value == null || value.isEmpty)
            //                     return "Please Enter name";
            //                   return null;
            //                 },
            //               ),
            //               const SizedBox(
            //                 height: 15,
            //               ),
            //               TextFormField(
            //                 controller: BfatherNameController,
            //                 decoration: InputDecoration(
            //                     hintText: "Father Name",
            //                     prefixIcon: const Icon(Icons.person),
            //                     border: OutlineInputBorder(
            //                         borderRadius: BorderRadius.circular(10))),
            //                 validator: (value) {
            //                   if (value == null || value.isEmpty)
            //                     return "Please Enter father name";
            //                   return null;
            //                 },
            //               ),
            //               const SizedBox(
            //                 height: 10,
            //               ),
            //               // TextFormField(
            //               //   controller: BmotherNameController,
            //               //   decoration: InputDecoration(
            //               //       hintText: "Mother Name",
            //               //       prefixIcon: const Icon(Icons.person),
            //               //       border: OutlineInputBorder(
            //               //           borderRadius: BorderRadius.circular(10))),
            //               //   validator: (value) {
            //               //     if (value == null || value.isEmpty)
            //               //       return "Please Enter mother name";
            //               //     return null;
            //               //   },
            //               // ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            // Card(
            //   margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            //   elevation: 5.0,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   borderOnForeground: true,
            //   child: Container(
            //     // height: MediaQuery.of(context).size.height/1,
            //     width: MediaQuery.of(context).size.width/1,
            //     decoration: const BoxDecoration(),
            //     child: Center(
            //       child: Padding(
            //         padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            //         child: Form(
            //           key: _formKey3,
            //           child: Column(
            //             children: [
            //               const Text(
            //                 "Programe Details",
            //                 style: TextStyle(
            //                     fontSize: 14, fontWeight: FontWeight.w500),
            //               ),
            //               const SizedBox(height: 9),
            //               TextFormField(
            //                 controller: ProgramNameController,
            //                 decoration: InputDecoration(
            //                     hintText: "First Programe Name",
            //                     prefixIcon: const Icon(Icons.person),
            //                     border: OutlineInputBorder(
            //                         borderRadius: BorderRadius.circular(10))),
            //                 validator: (value) {
            //                   if (value == null || value.isEmpty)
            //                     return "Please Enter name";
            //                   return null;
            //                 },
            //               ),
            //               const SizedBox(
            //                 height: 15,
            //               ),
            //               TextFormField(
            //                 controller: VenueController,
            //                 decoration: InputDecoration(
            //                     hintText: "Venue",
            //                     prefixIcon: const Icon(Icons.person),
            //                     border: OutlineInputBorder(
            //                         borderRadius: BorderRadius.circular(10))),
            //                 validator: (value) {
            //                   if (value == null || value.isEmpty)
            //                     return "Please Enter name";
            //                   return null;
            //                 },
            //               ),
            //               const SizedBox(height: 15),
            //               TextFormField(
            //                 controller: dateinput,
            //                 decoration: InputDecoration(
            //                     prefixIcon: IconButton(
            //                         onPressed: () async {
            //                           DateTime? pickedDate =
            //                           await showDatePicker(
            //                               context: context,
            //                               initialDate: DateTime.now(),
            //                               firstDate: DateTime(1950),
            //                               lastDate: DateTime(2100),
            //                               builder: (context, child) {
            //                                 return Theme(
            //                                     data: Theme.of(context)
            //                                         .copyWith(
            //                                         colorScheme:
            //                                         const ColorScheme
            //                                             .light(
            //                                           primary: colors.primary,
            //                                         )),
            //                                     child: child!);
            //                               });
            //                           if (pickedDate != null) {
            //                             //pickedDate output format => 2021-03-10 00:00:00.000
            //                             String formattedDate =
            //                             DateFormat('yyyy-MM-dd')
            //                                 .format(pickedDate);
            //                             //formatted date output using intl package =>  2021-03-16
            //                             setState(() {
            //                               dateinput.text =
            //                                   formattedDate; //set output date to TextField value.
            //                             });
            //                           }
            //                         },
            //                         icon: const Icon(Icons.calendar_today_outlined)),
            //                     hintText: 'dd-mm-yyyy',
            //                     border: OutlineInputBorder(
            //                         borderRadius: BorderRadius.circular(10))),
            //                 onTap: () async {
            //                   DateTime? pickedDate = await showDatePicker(
            //                       context: context,
            //                       initialDate: DateTime.now(),
            //                       firstDate: DateTime(1950),
            //                       lastDate: DateTime(2100),
            //                       builder: (context, child) {
            //                         return Theme(
            //                             data: Theme.of(context).copyWith(
            //                                 colorScheme: const ColorScheme.light(
            //                                   primary: colors.primary
            //                                 ),
            //                             ),
            //                             child: child!);
            //                       });
            //                   if (pickedDate != null) {
            //                     //pickedDate output format => 2021-03-10 00:00:00.000
            //                     String formattedDate =
            //                     DateFormat('yyyy-MM-dd').format(pickedDate);
            //                     //formatted date output using intl package =>  2021-03-16
            //                     setState(() {
            //                       dateinput.text =
            //                           formattedDate; //set output date to TextField value.
            //                     });
            //                   }
            //                 },
            //                 validator: (value) {
            //                   if (value == null || value.isEmpty)
            //                     return "Please Enter Date and time";
            //                   return null;
            //                 },
            //               ),
            //               const SizedBox(
            //                 height: 15,
            //               ),
            //               TextFormField(
            //                 controller: timecon,
            //                 decoration: InputDecoration(
            //                     hintText: "Time",
            //                     prefixIcon: IconButton(
            //                       onPressed: () async {
            //                         showTimePicker(
            //                           context: context,
            //                           initialTime: selectedTime,
            //                         ).then((value) {
            //                           setState(() {
            //                             selecttimee = value!;
            //                             timecon.text = selecttimee
            //                                 .format(context)
            //                                 .toString();
            //                           });
            //                         });
            //                       },
            //                       icon: const Icon(Icons.watch_later_rounded),
            //                     ),
            //                     border: OutlineInputBorder(
            //                         borderRadius: BorderRadius.circular(10))),
            //                 onTap: () {
            //                   showTimePicker(
            //                     context: context,
            //                     initialTime: selectedTime,
            //                   ).then((value) {
            //                     setState(() {
            //                       selecttimee = value!;
            //                       timecon.text =
            //                           selecttimee.format(context).toString();
            //                     });
            //                   });
            //                 },
            //                 validator: (value) {
            //                   if (value == null || value.isEmpty)
            //                     return "Please Select Time";
            //                   return null;
            //                 },
            //               ),
            //               const SizedBox(height: 9),
            //               TextFormField(
            //                 controller: secondProgrameCtr,
            //                 decoration: InputDecoration(
            //                     hintText: "Second Programe Name",
            //                     prefixIcon: const Icon(Icons.person),
            //                     border: OutlineInputBorder(
            //                         borderRadius: BorderRadius.circular(10))),
            //                 validator: (value) {
            //                   if (value == null || value.isEmpty)
            //                     return "Please Enter name";
            //                   return null;
            //                 },
            //               ),
            //               const SizedBox(
            //                 height: 15,
            //               ),
            //               TextFormField(
            //                 controller: venueCtr,
            //                 decoration: InputDecoration(
            //                     hintText: "Venue",
            //                     prefixIcon: const Icon(Icons.person),
            //                     border: OutlineInputBorder(
            //                         borderRadius: BorderRadius.circular(10))),
            //                 validator: (value) {
            //                   if (value == null || value.isEmpty)
            //                     return "Please Enter name";
            //                   return null;
            //                 },
            //               ),
            //               const SizedBox(height: 15),
            //               TextFormField(
            //                 controller: dateCtr,
            //                 decoration: InputDecoration(
            //                     prefixIcon: IconButton(
            //                         onPressed: () async {
            //                           DateTime? pickedDate =
            //                           await showDatePicker(
            //                               context: context,
            //                               initialDate: DateTime.now(),
            //                               firstDate: DateTime(1950),
            //                               lastDate: DateTime(2100),
            //                               builder: (context, child) {
            //                                 return Theme(
            //                                     data: Theme.of(context)
            //                                         .copyWith(
            //                                         colorScheme:
            //                                         const ColorScheme
            //                                             .light(
            //                                           primary: colors.primary,
            //                                         )),
            //                                     child: child!);
            //                               });
            //                           if (pickedDate != null) {
            //                             //pickedDate output format => 2021-03-10 00:00:00.000
            //                             String formattedDate =
            //                             DateFormat('yyyy-MM-dd').format(pickedDate);
            //                             //formatted date output using intl package =>  2021-03-16
            //                             setState(() {
            //                               dateCtr.text = formattedDate; //set output date to TextField value.
            //                             });
            //                           }
            //                         },
            //                         icon: const Icon(Icons.calendar_today_outlined)),
            //                     hintText: 'dd-mm-yyyy',
            //                     border: OutlineInputBorder(
            //                         borderRadius: BorderRadius.circular(10))),
            //                 onTap: () async {
            //                   DateTime? pickedDate = await showDatePicker(
            //                       context: context,
            //                       initialDate: DateTime.now(),
            //                       firstDate: DateTime(1950),
            //                       lastDate: DateTime(2100),
            //                       builder: (context, child) {
            //                         return Theme(
            //                             data: Theme.of(context).copyWith(
            //                               colorScheme: const ColorScheme.light(
            //                                   primary: colors.primary
            //                               ),
            //                             ),
            //                             child: child!);
            //                       });
            //                   if (pickedDate != null) {
            //                     //pickedDate output format => 2021-03-10 00:00:00.000
            //                     String formattedDate =
            //                     DateFormat('yyyy-MM-dd').format(pickedDate);
            //                     //formatted date output using intl package =>  2021-03-16
            //                     setState(() {
            //                       dateCtr.text = formattedDate; //set output date to TextField value.
            //                     });
            //                   }
            //                 },
            //                 validator: (value) {
            //                   if (value == null || value.isEmpty)
            //                     return "Please Enter Date and time";
            //                   return null;
            //                 },
            //               ),
            //               const SizedBox(
            //                 height: 15,
            //               ),
            //               TextFormField(
            //                 controller: timeCtr,
            //                 decoration: InputDecoration(
            //                     hintText: "Time",
            //                     prefixIcon: IconButton(
            //                       onPressed: () async {
            //                         showTimePicker(
            //                           context: context,
            //                           initialTime: selectedTime,
            //                         ).then((value) {
            //                           setState(() {
            //                             selecttimee = value!;
            //                             timeCtr.text = selecttimee
            //                                 .format(context)
            //                                 .toString();
            //                           });
            //                         });
            //                       },
            //                       icon: Icon(Icons.watch_later_rounded),
            //                     ),
            //                     border: OutlineInputBorder(
            //                         borderRadius: BorderRadius.circular(10))),
            //                 onTap: () {
            //                   showTimePicker(
            //                     context: context,
            //                     initialTime: selectedTime,
            //                   ).then((value) {
            //                     setState(() {
            //                       selecttimee = value!;
            //                       timeCtr.text =
            //                           selecttimee.format(context).toString();
            //                     });
            //                   });
            //                 },
            //                 validator: (value) {
            //                   if (value == null || value.isEmpty)
            //                     return "Please Select Time";
            //                   return null;
            //                 },
            //               ),
            //               const SizedBox(height: 9),
            //               TextFormField(
            //                 controller: thirdProgrameCtr,
            //                 decoration: InputDecoration(
            //                     hintText: "Third Programe Name",
            //                     prefixIcon: const Icon(Icons.person),
            //                     border: OutlineInputBorder(
            //                         borderRadius: BorderRadius.circular(10))),
            //                 validator: (value) {
            //                   if (value == null || value.isEmpty)
            //                     return "Please Enter name";
            //                   return null;
            //                 },
            //               ),
            //               const SizedBox(
            //                 height: 15,
            //               ),
            //               TextFormField(
            //                 controller: venueNameCtr,
            //                 decoration: InputDecoration(
            //                     hintText: "Venue",
            //                     prefixIcon: const Icon(Icons.person),
            //                     border: OutlineInputBorder(
            //                         borderRadius: BorderRadius.circular(10))),
            //                 validator: (value) {
            //                   if (value == null || value.isEmpty)
            //                     return "Please Enter name";
            //                   return null;
            //                 },
            //               ),
            //               const SizedBox(height: 15),
            //               TextFormField(
            //                 controller: dateNameCtr,
            //                 decoration: InputDecoration(
            //                     prefixIcon: IconButton(
            //                         onPressed: () async {
            //                           DateTime? pickedDate =
            //                           await showDatePicker(
            //                               context: context,
            //                               initialDate: DateTime.now(),
            //                               firstDate: DateTime(1950),
            //                               lastDate: DateTime(2100),
            //                               builder: (context, child) {
            //                                 return Theme(
            //                                     data: Theme.of(context)
            //                                         .copyWith(
            //                                         colorScheme:
            //                                         const ColorScheme
            //                                             .light(
            //                                           primary: colors.primary,
            //                                         )),
            //                                     child: child!);
            //                               });
            //                           if (pickedDate != null) {
            //                             //pickedDate output format => 2021-03-10 00:00:00.000
            //                             String formattedDate =
            //                             DateFormat('yyyy-MM-dd').format(pickedDate);
            //                             //formatted date output using intl package =>  2021-03-16
            //                             setState(() {
            //                               dateNameCtr.text = formattedDate; //set output date to TextField value.
            //                             });
            //                           }
            //                         },
            //                         icon: const Icon(Icons.calendar_today_outlined)),
            //                     hintText: 'dd-mm-yyyy',
            //                     border: OutlineInputBorder(
            //                         borderRadius: BorderRadius.circular(10))),
            //                 onTap: () async {
            //                   DateTime? pickedDate = await showDatePicker(
            //                       context: context,
            //                       initialDate: DateTime.now(),
            //                       firstDate: DateTime(1950),
            //                       lastDate: DateTime(2100),
            //                       builder: (context, child) {
            //                         return Theme(
            //                             data: Theme.of(context).copyWith(
            //                               colorScheme: const ColorScheme.light(
            //                                   primary: colors.primary
            //                               ),
            //                             ),
            //                             child: child!);
            //                       });
            //                   if (pickedDate != null) {
            //                     //pickedDate output format => 2021-03-10 00:00:00.000
            //                     String formattedDate =
            //                     DateFormat('yyyy-MM-dd').format(pickedDate);
            //                     //formatted date output using intl package =>  2021-03-16
            //                     setState(() {
            //                       dateNameCtr.text =
            //                           formattedDate; //set output date to TextField value.
            //                     });
            //                   }
            //                 },
            //                 validator: (value) {
            //                   if (value == null || value.isEmpty)
            //                     return "Please Enter Date and time";
            //                   return null;
            //                 },
            //               ),
            //               const SizedBox(
            //                 height: 15,
            //               ),
            //               TextFormField(
            //                 controller: timeNameCtr,
            //                 decoration: InputDecoration(
            //                     hintText: "Time",
            //                     prefixIcon: IconButton(
            //                       onPressed: () async {
            //                         showTimePicker(
            //                           context: context,
            //                           initialTime: selectedTime,
            //                         ).then((value) {
            //                           setState(() {
            //                             selecttimee = value!;
            //                             timeNameCtr.text = selecttimee
            //                                 .format(context)
            //                                 .toString();
            //                           });
            //                         });
            //                       },
            //                       icon: Icon(Icons.watch_later_rounded),
            //                     ),
            //                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            //                 onTap: () {
            //                   showTimePicker(
            //                     context: context,
            //                     initialTime: selectedTime,
            //                   ).then((value) {
            //                     setState(() {
            //                       selecttimee = value!;
            //                       timeNameCtr.text = selecttimee.format(context).toString();
            //                     });
            //                   });
            //                 },
            //                 validator: (value) {
            //                   if (value == null || value.isEmpty)
            //                     return "Please Select Time";
            //                   return null;
            //                 },
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              borderOnForeground: true,
              child: Container(
                // height: MediaQuery.of(context).size.height/4,
                // width: MediaQuery.of(context).size.width/1,
                decoration: const BoxDecoration(),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Form(
                      key: _formKey2,
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
                          const Text(
                            "Bride Details",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: BrideNameController,
                            decoration: InputDecoration(
                                hintText: "Bride Name",
                                prefixIcon: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter father name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: BfatherNameController,
                            decoration: InputDecoration(
                                hintText: "Bride Father Name",
                                prefixIcon: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter father name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: BmotherNameController,
                            decoration: InputDecoration(
                                hintText: "Bride Mother Name",
                                prefixIcon: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter mother name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              borderOnForeground: true,
              child: Container(
                // height: MediaQuery.of(context).size.height/1,
                // width: MediaQuery.of(context).size.width / 1,
                decoration: const BoxDecoration(),
                child: Center(
                  child: Padding(
                    padding:
                    const EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Form(
                      key: _formKey3,
                      child: Column(
                        children: [
                          const SizedBox(height: 9),
                          const Text("Programme Details",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: ProgramNameController,
                            decoration: InputDecoration(
                                hintText: "First Program Name",
                                prefixIcon: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: VenueController,
                            decoration: InputDecoration(
                                hintText: "Venue",
                                prefixIcon: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: dateinput,
                            decoration: InputDecoration(
                                prefixIcon: IconButton(
                                    onPressed: () async {
                                      DateTime? pickedDate =
                                      await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1950),
                                          lastDate: DateTime(2100),
                                          builder: (context, child) {
                                            return Theme(
                                                data: Theme.of(context)
                                                    .copyWith(
                                                    colorScheme:
                                                    const ColorScheme
                                                        .light(
                                                      primary: colors.primary,
                                                    )),
                                                child: child!);
                                          });
                                      if (pickedDate != null) {
                                        //pickedDate output format => 2021-03-10 00:00:00.000
                                        String formattedDate =
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickedDate);
                                        //formatted date output using intl package =>  2021-03-16
                                        setState(() {
                                          dateinput.text =
                                              formattedDate; //set output date to TextField value.
                                        });
                                      }
                                    },
                                    icon: const Icon(
                                        Icons.calendar_today_outlined)),
                                hintText: 'Date of first program',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2100),
                                  builder: (context, child) {
                                    return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: const ColorScheme.light(
                                              primary: colors.primary),
                                        ),
                                        child: child!);
                                  });
                              if (pickedDate != null) {
                                //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                                //formatted date output using intl package =>  2021-03-16
                                setState(() {
                                  dateinput.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter Date and time";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: timecon,
                            decoration: InputDecoration(
                                hintText: "Time",
                                prefixIcon: IconButton(
                                  onPressed: () async {
                                    showTimePicker(
                                      context: context,
                                      initialTime: selectedTime,
                                    ).then((value) {
                                      setState(() {
                                        selecttimee = value!;
                                        timecon.text = selecttimee
                                            .format(context)
                                            .toString();
                                      });
                                    });
                                  },
                                  icon: const Icon(Icons.watch_later_rounded),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: selectedTime,
                              ).then((value) {
                                setState(() {
                                  selecttimee = value!;
                                  timecon.text =
                                      selecttimee.format(context).toString();
                                });
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Select Time";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 9),
                          TextFormField(
                            controller: secondProgrameCtr,
                            decoration: InputDecoration(
                                hintText: "Second Program Name",
                                prefixIcon: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: venueCtr,
                            decoration: InputDecoration(
                                hintText: "Venue",
                                prefixIcon: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: dateCtr,
                            decoration: InputDecoration(
                                prefixIcon: IconButton(
                                    onPressed: () async {
                                      DateTime? pickedDate =
                                      await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1950),
                                          lastDate: DateTime(2100),
                                          builder: (context, child) {
                                            return Theme(
                                                data: Theme.of(context)
                                                    .copyWith(
                                                    colorScheme:
                                                    const ColorScheme
                                                        .light(
                                                      primary: colors.primary,
                                                    )),
                                                child: child!);
                                          });
                                      if (pickedDate != null) {
                                        //pickedDate output format => 2021-03-10 00:00:00.000
                                        String formattedDate =
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickedDate);
                                        //formatted date output using intl package =>  2021-03-16
                                        setState(() {
                                          dateCtr.text =
                                              formattedDate; //set output date to TextField value.
                                        });
                                      }
                                    },
                                    icon: const Icon(Icons.calendar_today_outlined)),
                                hintText: 'Date of second program',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2100),
                                  builder: (context, child) {
                                    return Theme(
                                        data: Theme.of(context).copyWith(colorScheme: const ColorScheme.light(primary: colors.primary)),
                                        child: child!);
                                  });
                              if (pickedDate != null) {
                                //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                //formatted date output using intl package =>  2021-03-16
                                setState(() {
                                  dateCtr.text = formattedDate; //set output date to TextField value.
                                });
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter Date and time";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: timeCtr,
                            decoration: InputDecoration(
                                hintText: "Time",
                                prefixIcon: IconButton(
                                  onPressed: () async {
                                    showTimePicker(
                                      context: context,
                                      initialTime: selectedTime,
                                    ).then((value) {
                                      setState(() {
                                        selecttimee = value!;
                                        timeCtr.text = selecttimee
                                            .format(context)
                                            .toString();
                                      });
                                    });
                                  },
                                  icon: Icon(Icons.watch_later_rounded),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: selectedTime,
                              ).then((value) {
                                setState(() {
                                  selecttimee = value!;
                                  timeCtr.text =
                                      selecttimee.format(context).toString();
                                });
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Select Time";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 9),
                          TextFormField(
                            controller: thirdProgrameCtr,
                            decoration: InputDecoration(
                              hintText: "Third Program Name",
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: venueNameCtr,
                            decoration: InputDecoration(
                              hintText: "Venue",
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: dateNameCtr,
                            decoration: InputDecoration(
                                prefixIcon: IconButton(
                                    onPressed: () async {
                                      DateTime? pickedDate =
                                      await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1950),
                                          lastDate: DateTime(2100),
                                          builder: (context, child) {
                                            return Theme(
                                                data: Theme.of(context)
                                                    .copyWith(
                                                  colorScheme:
                                                  const ColorScheme
                                                      .light(
                                                    primary: colors.primary,
                                                  ),
                                                ),
                                                child: child!);
                                          });
                                      if (pickedDate != null) {
                                        //pickedDate output format => 2021-03-10 00:00:00.000
                                        String formattedDate =
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickedDate);
                                        //formatted date output using intl package =>  2021-03-16
                                        setState(() {
                                          dateNameCtr.text =
                                              formattedDate; //set output date to TextField value.
                                        });
                                      }
                                    },
                                    icon: const Icon(
                                        Icons.calendar_today_outlined)),
                                hintText: 'Date of third program',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2100),
                                  builder: (context, child) {
                                    return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: const ColorScheme.light(
                                              primary: colors.primary),
                                        ),
                                        child: child!);
                                  });
                              if (pickedDate != null) {
                                //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                                //formatted date output using intl package =>  2021-03-16
                                setState(() {
                                  dateNameCtr.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter Date and time";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: timeNameCtr,
                            decoration: InputDecoration(
                                hintText: "Time",
                                prefixIcon: IconButton(
                                  onPressed: () async {
                                    showTimePicker(
                                      context: context,
                                      initialTime: selectedTime,
                                    ).then((value) {
                                      setState(() {
                                        selecttimee = value!;
                                        timeNameCtr.text = selecttimee
                                            .format(context)
                                            .toString();
                                      });
                                    });
                                  },
                                  icon: Icon(Icons.watch_later_rounded),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: selectedTime,
                              ).then((value) {
                                setState(() {
                                  selecttimee = value!;
                                  timeNameCtr.text =
                                      selecttimee.format(context).toString();
                                });
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Select Time";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 20,
            // ),

            // const SizedBox(
            //   height: 20,
            // ),
            // Card(
            //   margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            //   elevation: 5.0,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   borderOnForeground: true,
            //   child: Container(
            //     // height: MediaQuery.of(context).size.height / 4,
            //     // width: MediaQuery.of(context).size.width / 1,
            //     decoration: const BoxDecoration(),
            //     child: Center(
            //       child: Padding(
            //         padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            //         child: Form(
            //           key: _formKey4,
            //           child: Column(
            //             children: [
            //               // const Text(
            //               //   "Bride Details",
            //               //   style: TextStyle(
            //               //       fontSize: 14, fontWeight: FontWeight.w500),
            //               // ),
            //               // const SizedBox(height: 9),
            //               // TextFormField(
            //               //   controller: BrideNameController,
            //               //   decoration: InputDecoration(
            //               //       hintText: "Bride Name",
            //               //       prefixIcon: const Icon(Icons.person),
            //               //       border: OutlineInputBorder(
            //               //           borderRadius: BorderRadius.circular(10))),
            //               //   validator: (value) {
            //               //     if (value == null || value.isEmpty)
            //               //       return "Please Enter name";
            //               //     return null;
            //               //   },
            //               // ),
            //               // const SizedBox(
            //               //   height: 15,
            //               // ),
            //               // TextFormField(
            //               //   controller: BfatherNameController,
            //               //   decoration: InputDecoration(
            //               //       hintText: "Bride Father Name",
            //               //       prefixIcon: const Icon(Icons.person),
            //               //       border: OutlineInputBorder(
            //               //           borderRadius: BorderRadius.circular(10))),
            //               //   validator: (value) {
            //               //     if (value == null || value.isEmpty)
            //               //       return "Please Enter father name";
            //               //     return null;
            //               //   },
            //               // ),
            //               // const SizedBox(
            //               //   height: 15,
            //               // ),
            //               // TextFormField(
            //               //   controller: BmotherNameController,
            //               //   decoration: InputDecoration(
            //               //       hintText: "Bride Mother Name",
            //               //       prefixIcon: const Icon(Icons.person),
            //               //       border: OutlineInputBorder(
            //               //           borderRadius: BorderRadius.circular(10))),
            //               //   validator: (value) {
            //               //     if (value == null || value.isEmpty)
            //               //       return "Please Enter mother name";
            //               //     return null;
            //               //   },
            //               // ),
            //               // const SizedBox(
            //               //   height: 15,
            //               // ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                  backgroundColor: colors.secondary,
                fixedSize: const Size(180, 40)
              ),
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                Future.delayed(
                    const Duration(seconds: 2),
                (){
                  setState(() {
                    isLoading = false;
                  });
                // groomName = GroomNameController.text;
                // gFatherName = GfatherNameController.text;
                // gMotherName = GmotherNameController.text;
                //
                // brideName = BrideNameController.text;
                // bFatherName = BfatherNameController.text;
                // bMotherName = BmotherNameController.text;
                //
                // programName = ProgramNameController.text;
                // venue = VenueController.text;
                // Date = dateinput.text;
                // Time = timecon.text;
                //
                // secondPrograme = secondProgrameCtr.text;
                // secondVenue = venueCtr.text;
                // secondDate = dateCtr.text;
                // secondTime = timeCtr.text;
                //
                // thirdPrograme = thirdProgrameCtr.text;
                // thirdVenue = venueNameCtr.text;
                // thirdDate = dateNameCtr.text;
                // thirdTime = timeNameCtr.text;

                if (_formKey1.currentState!.validate()
                     && _formKey2.currentState!.validate() &&
                     _formKey3.currentState!.validate()
                ) {

                        Navigator.push(
                          context, MaterialPageRoute(
                          builder:
                              (context)=>WeddingCardScreen(
                            brideName: BrideNameController.text,
                            brideFatherName: BfatherNameController.text,
                            brideMotherName: BmotherNameController.text,
                            groomFatherName: GfatherNameController.text,
                            groomMotherName: GmotherNameController.text,
                            groomName: GroomNameController.text,
                            Date: dateinput.text,
                            programName:ProgramNameController.text ,
                            Time: timecon.text,
                            venueName: VenueController.text,
                            secondPrograme: secondProgrameCtr.text,
                            secondVenue: venueCtr.text,
                            secondDate: dateCtr.text,
                            secondTime: timeCtr.text,
                            thirdPrograme: thirdProgrameCtr.text,
                            thirdVenue: venueNameCtr.text,
                            thirdDate: dateNameCtr.text,
                            thirdTime: timeNameCtr.text,
                          ),
                          //     (context) => SecondWeddingForm(
                          //   brideName: brideName,
                          //   // brideFatherName: bFatherName,
                          //   // brideMotherName: bMotherName,
                          //   // groomFatherName: gFatherName,
                          //   // groomMotherName: gMotherName,
                          //   groomName: groomName,
                          //   Date: Date,
                          //   // programName: programName,
                          //   // Time: Time,
                          //   // venueName: venue,
                          //   // secondPrograme: secondPrograme,
                          //   // secondVenue: secondVenue,
                          //   // secondDate: secondDate,
                          //   // secondTime: secondTime,
                          //   // thirdPrograme: thirdPrograme,
                          //   // thirdVenue: thirdVenue,
                          //   // thirdDate: thirdDate,
                          //   // thirdTime: thirdTime,
                          // ),
                        ),
                        );
                      }


                }
                );
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
              child: isLoading? const CircularProgressIndicator(color: Colors.white,):const Text("Submit",),
            ),
            const SizedBox(height: 15),
            // Column(
            //   children: cards,
            // ),
          ],
        ),
      ),
    );
  }
}
