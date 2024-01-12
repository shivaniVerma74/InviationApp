/// status : true
/// message : "Slider List"
/// data : [{"id":"69","c_name":"Wedding Card","c_name_a":"","icon":"","sub_title":null,"description":null,"img":"https://developmentalphawizz.com/invitation_design/uploads/64354574d3e70.jpg","other_img":"","type":"vip","p_id":null,"service_type":"0","templates":[]},{"id":"72","c_name":"Birthday Card","c_name_a":"","icon":"","sub_title":null,"description":null,"img":"https://developmentalphawizz.com/invitation_design/uploads/6435454d0b021.jpg","other_img":"","type":"vip","p_id":null,"service_type":"0","templates":[{"category_id":"72","id":"36","title":"one","description":"One Birthday Card","template":"64e757dd7937f.png","html":null,"preview":"https://developmentalphawizz.com/invitation_design/uploads/64e757dd7af27.png","price":"100.00","image":"https://developmentalphawizz.com/invitation_design/uploads/64e757dd7937f.png"},{"category_id":"72","id":"37","title":"Two","description":"Two Birthday Card","template":"64e75b6616f24.png","html":null,"preview":"https://developmentalphawizz.com/invitation_design/uploads/64e75b6617b93.png","price":"50.00","image":"https://developmentalphawizz.com/invitation_design/uploads/64e75b6616f24.png"},{"category_id":"72","id":"38","title":"Three","description":"Third Birthday Card","template":"64e75c4d26bbc.png","html":null,"preview":"https://developmentalphawizz.com/invitation_design/uploads/64e75c824d1fd.png","price":"200.00","image":"https://developmentalphawizz.com/invitation_design/uploads/64e75c4d26bbc.png"}]}]

class NewCategoryModel {
  NewCategoryModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  NewCategoryModel.fromJson(dynamic json) {
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
NewCategoryModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => NewCategoryModel(  status: status ?? _status,
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

/// id : "69"
/// c_name : "Wedding Card"
/// c_name_a : ""
/// icon : ""
/// sub_title : null
/// description : null
/// img : "https://developmentalphawizz.com/invitation_design/uploads/64354574d3e70.jpg"
/// other_img : ""
/// type : "vip"
/// p_id : null
/// service_type : "0"
/// templates : []

class Data {
  Data({
      String? id, 
      String? cName, 
      String? cNameA, 
      String? icon, 
      dynamic subTitle, 
      dynamic description, 
      String? img, 
      String? otherImg, 
      String? type, 
      dynamic pId, 
      String? serviceType,
    List<Templates>? templates}){
    _id = id;
    _cName = cName;
    _cNameA = cNameA;
    _icon = icon;
    _subTitle = subTitle;
    _description = description;
    _img = img;
    _otherImg = otherImg;
    _type = type;
    _pId = pId;
    _serviceType = serviceType;
    _templates = templates;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _cName = json['c_name'];
    _cNameA = json['c_name_a'];
    _icon = json['icon'];
    _subTitle = json['sub_title'];
    _description = json['description'];
    _img = json['img'];
    _otherImg = json['other_img'];
    _type = json['type'];
    _pId = json['p_id'];
    _serviceType = json['service_type'];
    if (json['templates'] != null) {
      _templates = [];
      json['templates'].forEach((v) {
        _templates?.add(Templates.fromJson(v));
      });
    }
  }
  String? _id;
  String? _cName;
  String? _cNameA;
  String? _icon;
  dynamic _subTitle;
  dynamic _description;
  String? _img;
  String? _otherImg;
  String? _type;
  dynamic _pId;
  String? _serviceType;
  List<Templates>? _templates;
Data copyWith({  String? id,
  String? cName,
  String? cNameA,
  String? icon,
  dynamic subTitle,
  dynamic description,
  String? img,
  String? otherImg,
  String? type,
  dynamic pId,
  String? serviceType,
  List<Templates>? templates,
}) => Data(  id: id ?? _id,
  cName: cName ?? _cName,
  cNameA: cNameA ?? _cNameA,
  icon: icon ?? _icon,
  subTitle: subTitle ?? _subTitle,
  description: description ?? _description,
  img: img ?? _img,
  otherImg: otherImg ?? _otherImg,
  type: type ?? _type,
  pId: pId ?? _pId,
  serviceType: serviceType ?? _serviceType,
  templates: templates ?? _templates,
);
  String? get id => _id;
  String? get cName => _cName;
  String? get cNameA => _cNameA;
  String? get icon => _icon;
  dynamic get subTitle => _subTitle;
  dynamic get description => _description;
  String? get img => _img;
  String? get otherImg => _otherImg;
  String? get type => _type;
  dynamic get pId => _pId;
  String? get serviceType => _serviceType;
  List<Templates>? get templates => _templates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['c_name'] = _cName;
    map['c_name_a'] = _cNameA;
    map['icon'] = _icon;
    map['sub_title'] = _subTitle;
    map['description'] = _description;
    map['img'] = _img;
    map['other_img'] = _otherImg;
    map['type'] = _type;
    map['p_id'] = _pId;
    map['service_type'] = _serviceType;
    if (_templates != null) {
      map['templates'] = _templates?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Templates {
  String? categoryId;
  String? id;
  String? title;
  String? description;
  String? template;
  Null? html;
  String? preview;
  String? price;
  String? image;

  Templates(
      {this.categoryId,
        this.id,
        this.title,
        this.description,
        this.template,
        this.html,
        this.preview,
        this.price,
        this.image});

  Templates.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    template = json['template'];
    html = json['html'];
    preview = json['preview'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['template'] = this.template;
    data['html'] = this.html;
    data['preview'] = this.preview;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}