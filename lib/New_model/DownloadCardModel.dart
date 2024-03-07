/// status : true
/// message : "Saved Card List"
/// data : [{"id":"322","user_id":"68","price":"500","image":["https://developmentalphawizz.com/invitation_design/uploads/user_cards/65d6f17f903f7f4016f6fadc43396.png"],"is_paid":"1","is_completed":"1","transaction_id":"rzp_test_1DP5mmOlF5G5ag","created_at":"2024-02-22 12:49:01","updated_at":"2024-02-22 12:32:23"},{"id":"308","user_id":"68","price":"500","image":["https://developmentalphawizz.com/invitation_design/uploads/user_cards/65cdbe7b59b83b899449c43547acb.png","https://developmentalphawizz.com/invitation_design/uploads/user_cards/65cdbe7b59b83b899449c43547acb.png","https://developmentalphawizz.com/invitation_design/uploads/user_cards/65cdbe7b59b83b899449c43547acb.png"],"is_paid":"1","is_completed":"0","transaction_id":"rzp_test_1DP5mmOlF5G5ag","created_at":"2024-02-22 12:28:38","updated_at":"2024-02-15 13:04:19"}]

class DownloadCardModel {
  DownloadCardModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  DownloadCardModel.fromJson(dynamic json) {
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
DownloadCardModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => DownloadCardModel(  status: status ?? _status,
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

/// id : "322"
/// user_id : "68"
/// price : "500"
/// image : ["https://developmentalphawizz.com/invitation_design/uploads/user_cards/65d6f17f903f7f4016f6fadc43396.png"]
/// is_paid : "1"
/// is_completed : "1"
/// transaction_id : "rzp_test_1DP5mmOlF5G5ag"
/// created_at : "2024-02-22 12:49:01"
/// updated_at : "2024-02-22 12:32:23"

class Data {
  Data({
      String? id, 
      String? userId, 
      String? price, 
      List<String>? image, 
      String? isPaid, 
      String? isCompleted, 
      String? transactionId, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _price = price;
    _image = image;
    _isPaid = isPaid;
    _isCompleted = isCompleted;
    _transactionId = transactionId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _price = json['price'];
    _image = json['image'] != null ? json['image'].cast<String>() : [];
    _isPaid = json['is_paid'];
    _isCompleted = json['is_completed'];
    _transactionId = json['transaction_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _userId;
  String? _price;
  List<String>? _image;
  String? _isPaid;
  String? _isCompleted;
  String? _transactionId;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  String? id,
  String? userId,
  String? price,
  List<String>? image,
  String? isPaid,
  String? isCompleted,
  String? transactionId,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  price: price ?? _price,
  image: image ?? _image,
  isPaid: isPaid ?? _isPaid,
  isCompleted: isCompleted ?? _isCompleted,
  transactionId: transactionId ?? _transactionId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get id => _id;
  String? get userId => _userId;
  String? get price => _price;
  List<String>? get image => _image;
  String? get isPaid => _isPaid;
  String? get isCompleted => _isCompleted;
  String? get transactionId => _transactionId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['price'] = _price;
    map['image'] = _image;
    map['is_paid'] = _isPaid;
    map['is_completed'] = _isCompleted;
    map['transaction_id'] = _transactionId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}