import 'dart:convert';
import 'dart:io';

import 'package:doctorapp/Helper/loadingwidget.dart';
import 'package:doctorapp/New_model/CategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Helper/Color.dart';
import '../New_model/GetCityModel.dart';
import '../New_model/GetStateModel.dart';
import '../New_model/VendorModel.dart';
import '../api/api_services.dart';
import 'Bottom.dart';

class Vendor_Form extends StatefulWidget {
  const Vendor_Form({super.key});

  @override
  State<Vendor_Form> createState() => _Vendor_FormState();
}

int count = 0;

class _Vendor_FormState extends State<Vendor_Form> {
  VendorModel? vendorModel;
  bool isLoading = false;


  addVendor() async {
    setState(() {
      isLoading = true;
    });
    var headers = {
      'Cookie': 'ci_session=4c816ad4d416e192c2c782676f63ef4ac23b3571'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://developmentalphawizz.com/invitation_design/api/add_vendors'));
    request.fields.addAll({
      'name': namecn.text,
      'email': emailcn.text,
      'mobile': mobilecn.text,
      'event_name': eventcn.text,
      'category_id': selected_catagory.toString(),
      'city_id': cities.toString(),
      'state_id': stateId.toString(),
      'address': addresscn.text,
      'description': descriptioncn.text,
      "gst_number": gstCtr.text,
    });
    print("vendor form para ${request.fields}");
    // request.files
    //     .add(await http.MultipartFile.fromPath('image', _imageFile!.path));
    request.files.add(await http.MultipartFile.fromPath(
        'aadhar_image', _adharFrontImageFile!.path));
    request.files.add(await http.MultipartFile.fromPath(
        'aadhar_back_image', _adharBackImageFile!.path));
    request.files.add(
        await http.MultipartFile.fromPath('pancard', _pancardImageFile!.path));
    // request.files.add(await http.MultipartFile.fromPath('vendor_images[]', imagePathList[0]));
    // request.files.add(await http.MultipartFile.fromPath('vendor_images[]', imagePathList[1]));
    for (var i = 0; i < imagePathList.length; i++) {
      print('Imageeee $imagePathList');
      imagePathList.isEmpty
          ? null
          : request.files.add(await http.MultipartFile.fromPath(
              'vendor_images[]', imagePathList[i]));
    }
    print("vendor form para-------- ${request.files}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = jsonDecode(finalResponse);
      print("final Response$jsonResponse");
      Fluttertoast.showToast(msg: "${jsonResponse['message']}");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomScreen()));
      setState(() {
        isLoading = false;
      });
    } else {
      print(response.reasonPhrase);
      setState(() {
        isLoading = false;
      });
    }
  }

  final picker = ImagePicker();
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  File? _adharFrontImageFile;
  File? _adharBackImageFile;
  File? _pancardImageFile;
  bool isProfilePic = false;
  bool isAdharFrontPic = false;
  bool isAdharBackPic = false;
  bool isPanCard = false;

  Future<void> _picAdharFrontImage(ImageSource source) async {
    final adharFrontPicker = ImagePicker();
    final pickedImage = await adharFrontPicker.getImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _adharFrontImageFile = File(pickedImage.path);
      });
    }
  }

  Future<void> _picAdharBackImage(ImageSource source) async {
    final adharBackPicker = ImagePicker();
    final pickedImage = await adharBackPicker.getImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _adharBackImageFile = File(pickedImage.path);
      });
    }
  }

  Future<void> _picPancardImage(ImageSource source) async {
    final panCradPicker = ImagePicker();
    final pickedImage = await panCradPicker.getImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _pancardImageFile = File(pickedImage.path);
      });
    }
  }

  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  if (isProfilePic) {
                    _pickImage(ImageSource.gallery).then((value) {
                      setState(() {
                        isProfilePic = false;
                      });
                    });
                    ;
                  } else if (isAdharFrontPic) {
                    _picAdharFrontImage(ImageSource.gallery).then((value) {
                      setState(() {
                        isAdharFrontPic = false;
                      });
                    });
                    ;
                  } else {
                    _picAdharBackImage(ImageSource.gallery).then((value) {
                      setState(() {
                        isAdharBackPic = false;
                      });
                    });
                    ;
                  }
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                onTap: () {
                  if (isProfilePic) {
                    _pickImage(ImageSource.camera).then((value) {
                      setState(() {
                        isProfilePic = false;
                      });
                    });
                  } else if (isAdharFrontPic) {
                    _picAdharFrontImage(ImageSource.camera).then((value) {
                      setState(() {
                        isAdharFrontPic = false;
                      });
                    });
                    ;
                  } else {
                    _picAdharBackImage(ImageSource.camera).then((value) {
                      setState(() {
                        isAdharBackPic = false;
                      });
                    });
                    ;
                  }
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showImagePancard(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  _picPancardImage(ImageSource.gallery);
                  // if (isPanCard) {
                  //   _picPancardImage(ImageSource.gallery).then((value) {
                  //     setState(() {
                  //       isPanCard = false;
                  //     });
                  //   });
                  // } else {
                  //   _picPancardImage(ImageSource.gallery).then((value) {
                  //     setState(() {
                  //       isPanCard = false;
                  //     });
                  //   });
                  // }
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  _picPancardImage(ImageSource.camera);
                  // if (isPanCard) {
                  //   _picPancardImage(ImageSource.camera).then((value) {
                  //     setState(() {
                  //       isPanCard = false;
                  //     });
                  //   });
                  // } else {
                  //   _picPancardImage(ImageSource.camera).then((value) {
                  //     setState(() {
                  //       isPanCard = false;
                  //     });
                  //   });
                  // }
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  List imagePathList = [];
  bool isImages = false;
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
        source: ImageSource.camera,
        maxHeight: 120,
        maxWidth: 120,
        imageQuality: 80);
    if (pickedFile != null) {
      setState(() {
        count++;
        _imageFile = File(pickedFile.path);
        imagePathList.add(_imageFile?.path ?? "");
        isImages = true;
      });
      //Navigator.pop(context);
    }
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery,
        maxHeight: 120,
        maxWidth: 120,
        imageQuality: 80);
    if (pickedFile != null) {
      setState(() {
        count++;
        _imageFile = File(pickedFile.path);
        imagePathList.add(_imageFile?.path ?? "");
        isImages = true;
      });
      //Navigator.pop(context);
    }
  }

  void _showImages(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  _getFromGallery();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  _getFromCamera();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget uploadMultiImmage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () async {
            if (count < 5) {
              _showImages(context);
            } else {
              Fluttertoast.showToast(msg: "Please elect only 5 images");
            }
            // pickImageDialog(con  text, 1);
            // await pickImages();
          },
          child: Container(
            height: 40,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: colors.secondary),
            child: const Center(
              child: Text(
                "Upload Images",
                style: TextStyle(
                    color: colors.whiteTemp,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Visibility(visible: isImages, child: buildGridView()),
      ],
    );
  }

  Widget buildGridView() {
    return Container(
      height: 200,
      child: GridView.builder(
        itemCount: imagePathList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: colors.primary),
                  ),
                  width: MediaQuery.of(context).size.width / 2.8,
                  height: 170,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.file(File(imagePathList[index]),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 20,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      imagePathList.remove(imagePathList[index]);
                      count--;
                    });
                  },
                  child: Icon(
                    Icons.cancel,
                    size: 30,
                    color: Colors.red.withOpacity(0.7),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  // void _showImagePicker1(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return SafeArea(
  //         child: Wrap(
  //           children: <Widget>[
  //             ListTile(
  //               leading: Icon(Icons.photo_library),
  //               title: Text('Gallery'),
  //               onTap: () {
  //                 _pickImage1(ImageSource.gallery);
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //             ListTile(
  //               leading: Icon(Icons.photo_camera),
  //               title: Text('Camera'),
  //               onTap: () {
  //                 _pickImage1(ImageSource.camera);
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  String? stateId;
  String? states;
  GetStateModel? getStateModel;

  getState() async {
    var headers = {
      'Cookie': 'ci_session=d01e57d25f187766341c297a71e6a3ab1679cf1e'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse(ApiService.getStates));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var Result = await response.stream.bytesToString();
      final finalResult = GetStateModel.fromJson(json.decode(Result));
      setState(() {
        getStateModel = finalResult;
        for (var i = 0; i < getStateModel!.data!.length; i++) {
          stateId = getStateModel?.data?[i].id;
          print('------states----id$stateId');
        }
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  CategoryModel? categoryModel;
  getCategories() async {
    var headers = {
      'Cookie': 'ci_session=3d1fe757348246076fe86dd5c295a102e4ac54d5'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://developmentalphawizz.com/invitation_design/api/categories'));
    request.fields.addAll({'cat_type': '1'});

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = CategoryModel.fromJson(json.decode(finalResponse));
      setState(() {
        categoryModel = jsonResponse;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  GetCityModel? getCityModel;
  String? city_id;
  addCities() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("Addd city Apiiii");
    var headers = {
      'Cookie': 'ci_session=47a33758cb5f8f90b12340c2f31188b7fc5f9f92'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse(ApiService.getcitylist));
    request.fields.addAll({'state_id': '$states'});
    print('Request---------------${request.fields}');
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = GetCityModel.fromJson(json.decode(finalResponse));
      String city_id = jsonResponse.data![0].id ?? "";
      preferences.setString("city_id", city_id);
      print("city id herre $city_id");
      setState(() {
        getCityModel = jsonResponse;
      });
      // print("City Herererre ${getCityModel!.data![0].name}");
    } else {
      print(response.reasonPhrase);
    }
  }

  String? selected_Location;
  String? selected_city;
  String? selected_catagory;
  String? cities;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count = 0;
    getCategories();
    getState();
  }

  List<String> Location = [
    'MP',
    'Rajasthan',
    'UtterPrdesh',
    'Panjab',
  ];

  List<String> City = [
    'Indore',
    'Bhopal',
    'Gwalior',
    'Ujjain',
  ];

  List<String> Category = [
    'Indore',
    'Bhopal',
    'Gwalior',
    'Ujjain',
  ];

  TextEditingController namecn = TextEditingController();
  TextEditingController emailcn = TextEditingController();
  TextEditingController mobilecn = TextEditingController();
  TextEditingController eventcn = TextEditingController();
  TextEditingController addresscn = TextEditingController();
  TextEditingController descriptioncn = TextEditingController();
  TextEditingController gstCtr = TextEditingController();
  // TextEditingController  categorycn= TextEditingController();
  // TextEditingController  citycn= TextEditingController();
  // TextEditingController  statecn= TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.whiteTemp,
        title: const Text("Vendor"),
        centerTitle: true,
        flexibleSpace: Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
              color: colors.secondary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Name",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        controller: namecn,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: '',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)))),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    const Text(
                      "Email",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailcn,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: '',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)))),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    const Text(
                      "Mobile",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        controller: mobilecn,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 10) {
                            return 'Please Enter Your Mobile No';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: '',
                            counterText: "",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)))),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    const Text(
                      "Service Name",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        controller: eventcn,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Event';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: '',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)))),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    const Text(
                      "Category",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    DropdownButtonFormField<String>(
                      value: selected_catagory,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your category';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (newValue) {
                        setState(() {
                          selected_catagory = newValue;
                        });
                      },
                      items: categoryModel?.data?.map((items) {
                        return DropdownMenuItem(
                          value: items.id.toString(),
                          child: Text(items.cName.toString()),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: ' ',
                          label: const Text(
                            'Select Category',
                          ) //
                          ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    const Text(
                      "Select State",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    DropdownButtonFormField<String>(
                      value: states,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your State';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (newValue) {
                        setState(() {
                          states = newValue!;
                          addCities();
                        });
                      },
                      items: getStateModel?.data?.map((items) {
                        return DropdownMenuItem(
                          value: items.id.toString(),
                          child: Text(items.name.toString()),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: '',
                          label: const Text(
                            '  Select State',
                          ) //

                          ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    const Text(
                      "Select City",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    DropdownButtonFormField<String>(
                      value: cities,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your City';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (newValue) {
                        setState(() {
                          cities = newValue!;
                        });
                      },
                      items: getCityModel?.data?.map((items) {
                        return DropdownMenuItem(
                          value: items.id.toString(),
                          child: Text(items.name.toString()),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: ' ',
                        label: const Text(
                          'Select City',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    const Text(
                      "Address",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        controller: addresscn,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Address';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: '',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)))),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    const Text(
                      "Gst Number(Optional)",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        controller: gstCtr,
                        decoration: InputDecoration(
                            hintText: '',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)))),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    const Text(
                      "Description",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        controller: descriptioncn,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Description';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: '',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                            ),
                        ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    // Center(
                    //   child: Container(
                    //     height: 150,
                    //     width: 150,
                    //     decoration: BoxDecoration(
                    //         border: Border.all(color: Colors.black)),
                    //     child: _imageFile != null
                    //         ? Image.file(
                    //             _imageFile!.absolute,
                    //             fit: BoxFit.fill,
                    //           )
                    //         : Center(
                    //             child: Image.asset(
                    //                 'assets/images/Profile Pic.png')),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * .01,
                    // ),
                    // Center(
                    //   child: ElevatedButton(
                    //       style: ElevatedButton.styleFrom(
                    //           primary: colors.secondary),
                    //       onPressed: () {
                    //         setState(() {
                    //           isProfilePic = true;
                    //         });
                    //         _showImagePicker(context);
                    //       },
                    //       child: const Text("Profile Picture")),
                    // ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * .02,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Center(
                              child: Container(
                                height: 120,
                                width: 160,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: _adharFrontImageFile != null
                                    ? Image.file(
                                        _adharFrontImageFile!.absolute,
                                        fit: BoxFit.fill,
                                      )
                                    : Center(
                                        child: Image.asset(
                                        'assets/images/aadharimage.png',
                                      ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: colors.secondary),
                                onPressed: () {
                                  setState(() {
                                    isAdharFrontPic = true;
                                  });
                                  _showImagePicker(context);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Text(
                                    "Aadhar\n front Image",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Center(
                              child: Container(
                                height: 120,
                                width: 160,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.black)),
                                child: _adharBackImageFile != null
                                    ? Image.file(
                                        _adharBackImageFile!.absolute,
                                        fit: BoxFit.fill,
                                      )
                                    : Center(
                                        child: Image.asset(
                                            'assets/images/aadharimage.png'),
                                      ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: colors.secondary),
                                onPressed: () {
                                  setState(() {
                                    isAdharBackPic = true;
                                  });
                                  _showImagePicker(context);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Text(
                                    "Aadhar\n back Image",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    Column(
                      children: [
                        Center(
                          child: Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width / 1.2,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.black)),
                            child: _pancardImageFile != null
                                ? Image.file(
                                    _pancardImageFile!.absolute,
                                    fit: BoxFit.fill,
                                  )
                                : Center(
                                    child: Image.asset(
                                      'assets/images/aadharimage.png',
                                    ),
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: colors.secondary),
                            onPressed: () {
                              setState(() {
                                isPanCard = true;
                              });
                              _showImagePancard(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Pancard Image",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    uploadMultiImmage(),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    addVendor();
                  } else {
                    Fluttertoast.showToast(msg: "All Fields Required");
                  }
                },
                child: Center(
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colors.secondary),
                    child:  Center(
                      child: !isLoading?
                      Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ): LoadingWidget(context),
                    ),
                  ),
                  // ElevatedButton(
                  //    style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                  //     onPressed: () {
                  //       if (_formKey.currentState!.validate()) {
                  //         addVendor();
                  //       }
                  //       else{
                  //         Fluttertoast.showToast(msg: "All Fields Required");
                  //       }
                  //     },
                  //     child: const Text("Submit")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
