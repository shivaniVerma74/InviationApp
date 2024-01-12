import 'package:doctorapp/Helper/Color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:place_picker/place_picker.dart';
import '../Helper/Constant.dart';
import '../Screen/CardScreen.dart';


class Form_Screen extends StatefulWidget {
  Form_Screen({Key? key, this.image, this.temp_Id}) : super(key: key);
  String? image;
  String? temp_Id;
  @override
  State<Form_Screen> createState() => _Form_ScreenState();
}

class _Form_ScreenState extends State<Form_Screen> {

  @override
  void initState() {
    // TODO: implement initState
    print("=========image is ======${widget.image}===========");
    super.initState();
  }

  TextEditingController namectr = TextEditingController();
  TextEditingController addressCtr = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController timecon = TextEditingController();

  @override
  final _formKey= GlobalKey<FormState>();
  String? selectedDate;
  var selectedTime=TimeOfDay.now();
  // String? template_id = widget.id;
  var selecttimee;
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset : false,
        appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            foregroundColor: colors.whiteTemp,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            title: const Text('Birthday Form'),
            backgroundColor: colors.secondary),
        body:SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                borderOnForeground: true,
                child: Container(
                  height: MediaQuery.of(context).size.height/1.6,
                  width: MediaQuery.of(context).size.width/1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Center(
                    child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: namectr,
                                decoration: InputDecoration(
                                    hintText: "Name",
                                    prefixIcon: const Icon(Icons.person, color: colors.secondary,),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                    ),
                                ),
                                validator: (value){
                                  if(value == null || value.isEmpty)
                                    return "Please Enter name";
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: addressCtr,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: "Address",
                                  prefixIcon: Icon(Icons.location_on, color: colors.secondary,),
                                ),
                                validator: (value){
                                  if(value==null||value.isEmpty)
                                    return "Please Enter Addess";
                                  return null;
                                },
                              ),
                              const SizedBox(height: 15),
                              TextFormField(
                                controller: dateinput,
                                decoration: InputDecoration(
                                    prefixIcon: IconButton(
                                        onPressed: () async {
                                          DateTime? pickedDate = await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1950),
                                              lastDate: DateTime(2100),
                                              builder: (context, child) {
                                                return Theme(
                                                    data: Theme.of(context).copyWith(
                                                        colorScheme: ColorScheme.light(
                                                          primary: colors.primary,
                                                        )),
                                                    child: child!);
                                              });

                                          if (pickedDate != null) {
                                            //pickedDate output format => 2021-03-10 00:00:00.000
                                            String formattedDate =
                                            DateFormat('yyyy-MM-dd').format(pickedDate);
                                            //formatted date output using intl package =>  2021-03-16
                                            setState(() {
                                              dateinput.text = formattedDate; //set output date to TextField value.
                                            });
                                          }
                                        },
                                        icon: const Icon(Icons.calendar_today_outlined, color: colors.secondary,)
                                    ),
                                    hintText: 'dd-mm-yyyy',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                ),
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
                                                  primary: colors.primary,
                                                ),
                                            ),
                                            child: child!);
                                      });
                                  if (pickedDate != null) {
                                    //pickedDate output format => 2021-03-10 00:00:00.000
                                    String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                    //formatted date output using intl package =>  2021-03-16
                                    setState(() {
                                      dateinput.text = formattedDate; //set output date to TextField value.
                                    });
                                  }
                                },
                                validator: (value){
                                  if(value==null||value.isEmpty)
                                    return "Please Enter Date and time";
                                  return null;
                                },
                              ),
                              const SizedBox(height: 15,),
                              TextFormField(
                                controller: timecon,
                                decoration: InputDecoration(
                                    hintText: "Time",
                                    prefixIcon: IconButton(
                                        onPressed: () async {
                                          showTimePicker(context: context, initialTime: selectedTime,).then((value) {
                                            setState(() {
                                              selecttimee=value!;
                                              timecon.text=selecttimee.format(context).toString();
                                            });
                                          });
                                        },
                                        icon: const Icon(Icons.watch_later_rounded, color: colors.secondary,),
                                    ),
                                        border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))
                                ),
                                onTap: () {
                                  showTimePicker(context: context, initialTime: selectedTime,).then((value) {
                                    setState(() {
                                      selecttimee=value!;
                                      timecon.text=selecttimee.format(context).toString();
                                    });
                                  });
                                },
                                validator: (value){
                                  if(value==null||value.isEmpty)
                                    return "Please Select Time";
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: colors.secondary),
                                  onPressed:(){
                                    final name = namectr.text;
                                    final address = addressCtr.text;
                                    if(_formKey.currentState!.validate()) {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => CardScreen(
                                          name: name, address: address, image: widget.image, datee: dateinput.text.toString(), timee: timecon.text, temp_Id:widget.temp_Id.toString())
                                      ),
                                      );
                                    }
                                      setState(() {});
                                  },
                                  child: const Text("Submit")
                              ),
                            ],
                          ),
                        ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}

