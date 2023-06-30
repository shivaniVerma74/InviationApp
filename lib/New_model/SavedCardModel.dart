/// status : true
/// message : "Template saved success"
/// data : [{"id":"67","user_id":"21","template_id":"24","image":"https://developmentalphawizz.com/invitation_design/uploads/profile_pics/649d3f08ca55e.png","price":"100.00","is_paid":"1","transaction_id":"rzp_test_1DP5mmOlF5G5ag","created_at":"2023-06-29 08:23:38","updated_at":"2023-06-29 08:21:28"},{"id":"71","user_id":"21","template_id":"24","image":"https://developmentalphawizz.com/invitation_design/uploads/profile_pics/649d40309660d.png","price":"100.00","is_paid":"1","transaction_id":"rzp_test_1DP5mmOlF5G5ag","created_at":"2023-06-29 08:27:05","updated_at":"2023-06-29 08:26:24"}]

class SavedCardModel {
  SavedCardModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  SavedCardModel.fromJson(dynamic json) {
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
SavedCardModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => SavedCardModel(  status: status ?? _status,
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

/// id : "67"
/// user_id : "21"
/// template_id : "24"
/// image : "https://developmentalphawizz.com/invitation_design/uploads/profile_pics/649d3f08ca55e.png"
/// price : "100.00"
/// is_paid : "1"
/// transaction_id : "rzp_test_1DP5mmOlF5G5ag"
/// created_at : "2023-06-29 08:23:38"
/// updated_at : "2023-06-29 08:21:28"

class Data {
  Data({
      String? id, 
      String? userId, 
      String? templateId, 
      String? image, 
      String? price, 
      String? isPaid, 
      String? transactionId, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _templateId = templateId;
    _image = image;
    _price = price;
    _isPaid = isPaid;
    _transactionId = transactionId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _templateId = json['template_id'];
    _image = json['image'];
    _price = json['price'];
    _isPaid = json['is_paid'];
    _transactionId = json['transaction_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _userId;
  String? _templateId;
  String? _image;
  String? _price;
  String? _isPaid;
  String? _transactionId;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  String? id,
  String? userId,
  String? templateId,
  String? image,
  String? price,
  String? isPaid,
  String? transactionId,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  templateId: templateId ?? _templateId,
  image: image ?? _image,
  price: price ?? _price,
  isPaid: isPaid ?? _isPaid,
  transactionId: transactionId ?? _transactionId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get id => _id;
  String? get userId => _userId;
  String? get templateId => _templateId;
  String? get image => _image;
  String? get price => _price;
  String? get isPaid => _isPaid;
  String? get transactionId => _transactionId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['template_id'] = _templateId;
    map['image'] = _image;
    map['price'] = _price;
    map['is_paid'] = _isPaid;
    map['transaction_id'] = _transactionId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}