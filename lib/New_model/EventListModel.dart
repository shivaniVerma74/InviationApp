/// status : true
/// message : "Event Manager List"
/// data : [{"city_name":"Jaipur","uname":"Devesh","email":"Devesh33@gmail.com","mobile":"9993224906","event_name":"devesh store","vendor_id":"130","description":"demo","profile_image":"https://developmentalphawizz.com/invitation_design/uploads/profile_pics/64895dff60108.jpg","status":"0","distance":"1 KM"},{"city_name":"Baran","uname":"Wasim","email":"Wasim@gmail.com","mobile":"9977252525","event_name":"New Year","vendor_id":"133","description":"sdv  erg ser","profile_image":"https://developmentalphawizz.com/invitation_design/uploads/profile_pics/64afcbcc7d39e.jpeg","status":"0","distance":"1 KM"},{"city_name":"Jaipur","uname":"Khandelwal Delivery","email":"Ksh@gmail.com","mobile":"9192939495","event_name":"Birthday","vendor_id":"128","description":"today is my birthday","profile_image":"https://developmentalphawizz.com/invitation_design/uploads/profile_pics/649052332055a.png","status":"1","distance":"1 KM"},{"city_name":"Jaipur","uname":"Atul","email":"Gautam@gmail.com","mobile":"7979878778","event_name":"New year","vendor_id":"129","description":"ehyrth drh","profile_image":"https://developmentalphawizz.com/invitation_design/uploads/profile_pics/643540018ade0.jpg","status":"0","distance":"1 KM"}]

class EventListModel {
  EventListModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  EventListModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<Data>? _data;
EventListModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => EventListModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// city_name : "Jaipur"
/// uname : "Devesh"
/// email : "Devesh33@gmail.com"
/// mobile : "9993224906"
/// event_name : "devesh store"
/// vendor_id : "130"
/// description : "demo"
/// profile_image : "https://developmentalphawizz.com/invitation_design/uploads/profile_pics/64895dff60108.jpg"
/// status : "0"
/// distance : "1 KM"

class Data {
  Data({
      String? cityName, 
      String? uname, 
      String? email, 
      String? mobile, 
      String? eventName, 
      String? vendorId, 
      String? description, 
      String? profileImage, 
      String? status, 
      String? distance,}){
    _cityName = cityName;
    _uname = uname;
    _email = email;
    _mobile = mobile;
    _eventName = eventName;
    _vendorId = vendorId;
    _description = description;
    _profileImage = profileImage;
    _status = status;
    _distance = distance;
}

  Data.fromJson(dynamic json) {
    _cityName = json['city_name'];
    _uname = json['uname'];
    _email = json['email'];
    _mobile = json['mobile'];
    _eventName = json['event_name'];
    _vendorId = json['vendor_id'];
    _description = json['description'];
    _profileImage = json['profile_image'];
    _status = json['status'];
    _distance = json['distance'];
  }
  String? _cityName;
  String? _uname;
  String? _email;
  String? _mobile;
  String? _eventName;
  String? _vendorId;
  String? _description;
  String? _profileImage;
  String? _status;
  String? _distance;
Data copyWith({  String? cityName,
  String? uname,
  String? email,
  String? mobile,
  String? eventName,
  String? vendorId,
  String? description,
  String? profileImage,
  String? status,
  String? distance,
}) => Data(  cityName: cityName ?? _cityName,
  uname: uname ?? _uname,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  eventName: eventName ?? _eventName,
  vendorId: vendorId ?? _vendorId,
  description: description ?? _description,
  profileImage: profileImage ?? _profileImage,
  status: status ?? _status,
  distance: distance ?? _distance,
);
  String? get cityName => _cityName;
  String? get uname => _uname;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get eventName => _eventName;
  String? get vendorId => _vendorId;
  String? get description => _description;
  String? get profileImage => _profileImage;
  String? get status => _status;
  String? get distance => _distance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city_name'] = _cityName;
    map['uname'] = _uname;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['event_name'] = _eventName;
    map['vendor_id'] = _vendorId;
    map['description'] = _description;
    map['profile_image'] = _profileImage;
    map['status'] = _status;
    map['distance'] = _distance;
    return map;
  }

}