import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Helper/Color.dart';
import 'SecondWeddingForm.dart';
import 'WeddingCardScreen.dart';

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
final _formKey = GlobalKey<FormState>();
var selecttimee;

// List<GlobalKey<FormState>> formKeys = [GlobalKey<FormState>(), GlobalKey<FormState>(), GlobalKey<FormState>()];
final _formKey2 = GlobalKey<FormState>();
final _formKey3 = GlobalKey<FormState>();
final _formKey4 = GlobalKey<FormState>();

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              borderOnForeground: true,
              child: Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width / 1,
                decoration: const BoxDecoration(),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 15, right: 15),
                      child: Column(
                        children: [
                          // const Text(
                          //   "Groom Details",
                          //   style: TextStyle(
                          //       fontSize: 14, fontWeight: FontWeight.w500),
                          // ),
                          const SizedBox(height: 9),
                          TextFormField(
                            controller: GroomNameController,
                            decoration: InputDecoration(
                                hintText: "Groom Name",
                                prefixIcon: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return "Please Enter name";
                              return null;
                            },
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
                              if (value == null || value.isEmpty)
                                return "Please Enter father name";
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
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
                                hintText: 'dd-mm-yyyy',
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
                              if (value == null || value.isEmpty)
                                return "Please Enter Date and time";
                              return null;
                            },
                          ),
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
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: colors.secondary),
              onPressed: () {
                groomName = GroomNameController.text;
                // gFatherName = GfatherNameController.text;
                // gMotherName = GmotherNameController.text;
                brideName = BrideNameController.text;
                // bFatherName = BfatherNameController.text;
                // bMotherName = BmotherNameController.text;
                // programName = ProgramNameController.text;
                // venue = VenueController.text;
                Date = dateinput.text;
                // Time = timecon.text;

                // secondPrograme = secondProgrameCtr.text;
                // secondVenue = venueCtr.text;
                // secondDate = dateCtr.text;
                // secondTime = timeCtr.text;
                //
                // thirdPrograme = thirdProgrameCtr.text;
                // thirdVenue = venueNameCtr.text;
                // thirdDate = dateNameCtr.text;
                // thirdTime = timeNameCtr.text;

                if (_formKey.currentState!.validate()
                    // && _formKey2.currentState!.validate() &&
                    // _formKey3.currentState!.validate()
                ) {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => SecondWeddingForm(
                        brideName: brideName,
                        // brideFatherName: bFatherName,
                        // brideMotherName: bMotherName,
                        // groomFatherName: gFatherName,
                        // groomMotherName: gMotherName,
                        groomName: groomName,
                        Date: Date,
                        // programName: programName,
                        // Time: Time,
                        // venueName: venue,
                        // secondPrograme: secondPrograme,
                        // secondVenue: secondVenue,
                        // secondDate: secondDate,
                        // secondTime: secondTime,
                        // thirdPrograme: thirdPrograme,
                        // thirdVenue: thirdVenue,
                        // thirdDate: thirdDate,
                        // thirdTime: thirdTime,
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
              child: const Text("Next",),
            ),
            // Column(
            //   children: cards,
            // ),
          ],
        ),
      ),
    );
  }
}
