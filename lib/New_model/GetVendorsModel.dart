class MyCategoriesModel {
  bool? status;
  String? message;
  List<AllVendorData>? data;

  MyCategoriesModel({this.status, this.message, this.data});

  MyCategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AllVendorData>[];
      json['data'].forEach((v) {
        data!.add(new AllVendorData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllVendorData {
  String? id;
  String? email;
  String? mobile;
  String? address;
  String? description;
  String? categoryId;
  Null? perDCharge;
  Null? perHCharge;
  Null? experience;
  Null? vehicleNumber;
  Null? vehicleType;
  Null? rcBook;
  Null? perKmCharge;
  String? lat;
  String? lang;
  String? uname;
  String? password;
  String? profileImage;
  List<String>? vendorImages;
  String? aadharImage;
  String? aadharBackImage;
  String? deviceToken;
  Null? otp;
  String? status;
  String? wallet;
  String? balance;
  Null? lastLogin;
  String? createdAt;
  String? updatedAt;
  String? roll;
  String? adharCard;
  String? pancard;
  String? gstNo;
  String? gstNumber;
  String? fssai;
  String? storeName;
  String? bandDetails;
  String? cityId;
  String? stateId;
  String? vehicleNo;
  String? registarionCard;
  String? drivingLicense;
  String? categoriesId;
  String? companyName;
  String? roleUser;
  String? event;
  String? latitude;
  String? longitude;
  String? deliveryType;
  String? refferalCode;
  String? friendCode;
  String? onlineStatus;
  String? storeDescription;
  String? commision;
  String? restoType;
  Null? gender;
  String? cashCollection;
  String? commisionAmountType;

  AllVendorData(
      {this.id,
        this.email,
        this.mobile,
        this.address,
        this.description,
        this.categoryId,
        this.perDCharge,
        this.perHCharge,
        this.experience,
        this.vehicleNumber,
        this.vehicleType,
        this.rcBook,
        this.perKmCharge,
        this.lat,
        this.lang,
        this.uname,
        this.password,
        this.profileImage,
        this.vendorImages,
        this.aadharImage,
        this.aadharBackImage,
        this.deviceToken,
        this.otp,
        this.status,
        this.wallet,
        this.balance,
        this.lastLogin,
        this.createdAt,
        this.updatedAt,
        this.roll,
        this.adharCard,
        this.pancard,
        this.gstNo,
        this.gstNumber,
        this.fssai,
        this.storeName,
        this.bandDetails,
        this.cityId,
        this.stateId,
        this.vehicleNo,
        this.registarionCard,
        this.drivingLicense,
        this.categoriesId,
        this.companyName,
        this.roleUser,
        this.event,
        this.latitude,
        this.longitude,
        this.deliveryType,
        this.refferalCode,
        this.friendCode,
        this.onlineStatus,
        this.storeDescription,
        this.commision,
        this.restoType,
        this.gender,
        this.cashCollection,
        this.commisionAmountType});

  AllVendorData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    description = json['description'];
    categoryId = json['category_id'];
    perDCharge = json['per_d_charge'];
    perHCharge = json['per_h_charge'];
    experience = json['experience'];
    vehicleNumber = json['vehicle_number'];
    vehicleType = json['vehicle_type'];
    rcBook = json['rc_book'];
    perKmCharge = json['per_km_charge'];
    lat = json['lat'];
    lang = json['lang'];
    uname = json['uname'];
    password = json['password'];
    profileImage = json['profile_image'];
    vendorImages = json['vendor_images'].cast<String>();
    aadharImage = json['aadhar_image'];
    aadharBackImage = json['aadhar_back_image'];
    deviceToken = json['device_token'];
    otp = json['otp'];
    status = json['status'];
    wallet = json['wallet'];
    balance = json['balance'];
    lastLogin = json['last_login'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    roll = json['roll'];
    adharCard = json['adhar_card'];
    pancard = json['pancard'];
    gstNo = json['gst_no'];
    gstNumber = json['gst_number'];
    fssai = json['fssai'];
    storeName = json['store_name'];
    bandDetails = json['band_details'];
    cityId = json['city_id'];
    stateId = json['state_id'];
    vehicleNo = json['vehicle_no'];
    registarionCard = json['registarion_card'];
    drivingLicense = json['driving_license'];
    categoriesId = json['categories_id'];
    companyName = json['company_name'];
    roleUser = json['role_user'];
    event = json['event'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    deliveryType = json['delivery_type'];
    refferalCode = json['refferal_code'];
    friendCode = json['friend_code'];
    onlineStatus = json['online_status'];
    storeDescription = json['store_description'];
    commision = json['commision'];
    restoType = json['resto_type'];
    gender = json['gender'];
    cashCollection = json['cash_collection'];
    commisionAmountType = json['commision_amount_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['description'] = this.description;
    data['category_id'] = this.categoryId;
    data['per_d_charge'] = this.perDCharge;
    data['per_h_charge'] = this.perHCharge;
    data['experience'] = this.experience;
    data['vehicle_number'] = this.vehicleNumber;
    data['vehicle_type'] = this.vehicleType;
    data['rc_book'] = this.rcBook;
    data['per_km_charge'] = this.perKmCharge;
    data['lat'] = this.lat;
    data['lang'] = this.lang;
    data['uname'] = this.uname;
    data['password'] = this.password;
    data['profile_image'] = this.profileImage;
    data['vendor_images'] = this.vendorImages;
    data['aadhar_image'] = this.aadharImage;
    data['aadhar_back_image'] = this.aadharBackImage;
    data['device_token'] = this.deviceToken;
    data['otp'] = this.otp;
    data['status'] = this.status;
    data['wallet'] = this.wallet;
    data['balance'] = this.balance;
    data['last_login'] = this.lastLogin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['roll'] = this.roll;
    data['adhar_card'] = this.adharCard;
    data['pancard'] = this.pancard;
    data['gst_no'] = this.gstNo;
    data['gst_number'] = this.gstNumber;
    data['fssai'] = this.fssai;
    data['store_name'] = this.storeName;
    data['band_details'] = this.bandDetails;
    data['city_id'] = this.cityId;
    data['state_id'] = this.stateId;
    data['vehicle_no'] = this.vehicleNo;
    data['registarion_card'] = this.registarionCard;
    data['driving_license'] = this.drivingLicense;
    data['categories_id'] = this.categoriesId;
    data['company_name'] = this.companyName;
    data['role_user'] = this.roleUser;
    data['event'] = this.event;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['delivery_type'] = this.deliveryType;
    data['refferal_code'] = this.refferalCode;
    data['friend_code'] = this.friendCode;
    data['online_status'] = this.onlineStatus;
    data['store_description'] = this.storeDescription;
    data['commision'] = this.commision;
    data['resto_type'] = this.restoType;
    data['gender'] = this.gender;
    data['cash_collection'] = this.cashCollection;
    data['commision_amount_type'] = this.commisionAmountType;
    return data;
  }
}
