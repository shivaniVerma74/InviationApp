import 'package:doctorapp/Helper/Color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:place_picker/place_picker.dart';

import '../Screen/CardScreen.dart';


class Form_Screen extends StatefulWidget {
  const Form_Screen({Key? key}) : super(key: key);

  @override
  State<Form_Screen> createState() => _Form_ScreenState();
}

class _Form_ScreenState extends State<Form_Screen> {
  TextEditingController namectr = TextEditingController();
  TextEditingController addressCtr = TextEditingController();
  TextEditingController dateinput = TextEditingController();

  @override
  final _formKey= GlobalKey<FormState>();
  String? selectedDate;

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset : false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: colors.primary,
          centerTitle: true,
          title: Text("Birthday Form"),
        ),
        body:SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                borderOnForeground: true,
                child: Container(
                  height: MediaQuery.of(context).size.height/1.8,
                  width: MediaQuery.of(context).size.width/1,
                  decoration: BoxDecoration(
                  ),
                  child: Center(
                    child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: EdgeInsets.only(top: 50,left: 15,right: 15),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: namectr,
                                decoration: InputDecoration(
                                    hintText: "Name",
                                    prefixIcon: Icon(Icons.person),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))
                                ),
                                validator: (value){
                                  if(value==null||value.isEmpty)
                                    return "Please Enter name";
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: addressCtr,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: "Address",
                                  prefixIcon: Icon(Icons.location_on),
                                ),
                                validator: (value){
                                  if(value==null||value.isEmpty)
                                    return "Please Enter Addess";
                                  return null;
                                },
                              ),
                              SizedBox(height: 15,),
                              TextFormField(
                                onTap:
                                    () async{
                                  DateTime? datePicked = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2024));
                                  if (datePicked != null) {
                                    print(
                                        'Date Selected:${datePicked.day}-${datePicked.month}-${datePicked.year}');
                                    String formettedDate =
                                    DateFormat('dd-MM-yyyy').format(datePicked);
                                    setState(() {
                                      selectedDate = formettedDate;
                                      dateinput.text = formettedDate;
                                    });
                                  }
                                },
                                controller: dateinput,
                                decoration: InputDecoration(
                                    prefixIcon: IconButton(
                                        onPressed: () async {
                                          DateTime? datePicked = await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2000),
                                              lastDate: DateTime(2024));
                                          if (datePicked != null) {
                                            print(
                                                'Date Selected:${datePicked.day}-${datePicked.month}-${datePicked.year}');
                                            String formettedDate =
                                            DateFormat('dd-MM-yyyy').format(datePicked);
                                            setState(() {
                                              selectedDate = formettedDate;
                                            });
                                          }
                                        },
                                        icon: Icon(Icons.calendar_today_outlined)
                                    ),
                                    hintText: 'dd-mm-yyyy',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))),
                                validator: (value){
                                  if(value==null||value.isEmpty)
                                    return "Please Enter Date and time";
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: colors.primary),
                                  onPressed: (){
                                    final name = namectr.text;
                                    final address = addressCtr.text;
                                    if(_formKey.currentState!.validate())
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => CardScreen(name: name, address: address)));
                                      setState(() {});
                                  },
                                  child: Text("Submit",)
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

