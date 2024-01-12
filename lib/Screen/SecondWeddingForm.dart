import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Helper/Color.dart';
import '../Helper/Constant.dart';
import 'ThirdWeddingForm.dart';
import 'WeddingForm.dart';

class SecondWeddingForm extends StatefulWidget {
  final String? groomName;
  final String? brideName;
  String? Date;
  SecondWeddingForm({
    Key? key,
    this.Date,
    this.brideName,
    this.groomName,
  }) : super(key: key);

  @override
  State<SecondWeddingForm> createState() => _SecondWeddingFormState();
}

class _SecondWeddingFormState extends State<SecondWeddingForm> {
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              borderOnForeground: true,
              child: Container(
                // height: MediaQuery.of(context).size.height/1,
                width: MediaQuery.of(context).size.width / 1,
                decoration: const BoxDecoration(),
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Form(
                      key: _formKey3,
                      child: Column(
                        children: [
                          const Text("Programe Details",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 9),
                          TextFormField(
                            controller: ProgramNameController,
                            decoration: InputDecoration(
                                hintText: "First Program Name",
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
                            controller: VenueController,
                            decoration: InputDecoration(
                                hintText: "Venue",
                                prefixIcon: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return "Please Enter name";
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
                              if (value == null || value.isEmpty)
                                return "Please Select Time";
                              return null;
                            },
                          ),
                          const SizedBox(height: 9),
                          TextFormField(
                            controller: secondProgrameCtr,
                            decoration: InputDecoration(
                                hintText: "Second Programe Name",
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
                            controller: venueCtr,
                            decoration: InputDecoration(
                                hintText: "Venue",
                                prefixIcon: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return "Please Enter name";
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
                                hintText: 'dd-mm-yyyy',
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
                              if (value == null || value.isEmpty)
                                return "Please Enter Date and time";
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
                              if (value == null || value.isEmpty)
                                return "Please Select Time";
                              return null;
                            },
                          ),
                          const SizedBox(height: 9),
                          TextFormField(
                            controller: thirdProgrameCtr,
                            decoration: InputDecoration(
                              hintText: "Third Programe Name",
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
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
                            controller: venueNameCtr,
                            decoration: InputDecoration(
                              hintText: "Venue",
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return "Please Enter name";
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
                                  dateNameCtr.text =
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
                              if (value == null || value.isEmpty)
                                return "Please Select Time";
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
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: colors.secondary),
              onPressed: () {
                groomName = widget.groomName;
                // gFatherName = GfatherNameController.text;
                // gMotherName = GmotherNameController.text;
                brideName = widget.brideName;
                // bFatherName = BfatherNameController.text;
                // bMotherName = BmotherNameController.text;
                programName = ProgramNameController.text;
                venue = VenueController.text;
                Date = widget.Date;
                // Time = timecon.text;

                secondPrograme = secondProgrameCtr.text;
                secondVenue = venueCtr.text;
                secondDate = dateCtr.text;
                secondTime = timeCtr.text;

                thirdPrograme = thirdProgrameCtr.text;
                thirdVenue = venueNameCtr.text;
                thirdDate = dateNameCtr.text;
                thirdTime = timeNameCtr.text;

                if (_formKey3.currentState!.validate()
                    // && _formKey2.currentState!.validate() &&
                    // _formKey3.currentState!.validate()
                    ) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThirdWeddingForm(
                        brideName: brideName,
                        // brideFatherName: bFatherName,
                        // brideMotherName: bMotherName,
                        // groomFatherName: gFatherName,
                        // groomMotherName: gMotherName,
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
              child: const Text(
                "Next",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
