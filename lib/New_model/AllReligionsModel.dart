/// status : 1
/// msg : "Sub Category Found"
/// categories : [{"id":"2","c_name":"Hindu","c_name_a":"","icon":"https://developmentalphawizz.com/invitation_design/uploads/","img":"https://developmentalphawizz.com/invitation_design/uploads/65c322204ec88.png","type":null,"cat_id":"69","cat_name":"Wedding Card"},{"id":"3","c_name":"Buddhist","c_name_a":"","icon":"https://developmentalphawizz.com/invitation_design/uploads/","img":"https://developmentalphawizz.com/invitation_design/uploads/65c34d0db2b09.png","type":null,"cat_id":"69","cat_name":"Wedding Card"},{"id":"4","c_name":"Sikh","c_name_a":"","icon":"https://developmentalphawizz.com/invitation_design/uploads/","img":"https://developmentalphawizz.com/invitation_design/uploads/65c34d245617e.png","type":null,"cat_id":"69","cat_name":"Wedding Card"}]

class AllReligionsModel {
  AllReligionsModel({
      num? status, 
      String? msg, 
      List<CategoriesData>? categories,}){
    _status = status;
    _msg = msg;
    _categories = categories;
}

  AllReligionsModel.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(CategoriesData.fromJson(v));
      });
    }
  }
  num? _status;
  String? _msg;
  List<CategoriesData>? _categories;
AllReligionsModel copyWith({  num? status,
  String? msg,
  List<CategoriesData>? categories,
}) => AllReligionsModel(  status: status ?? _status,
  msg: msg ?? _msg,
  categories: categories ?? _categories,
);
  num? get status => _status;
  String? get msg => _msg;
  List<CategoriesData>? get categories => _categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "2"
/// c_name : "Hindu"
/// c_name_a : ""
/// icon : "https://developmentalphawizz.com/invitation_design/uploads/"
/// img : "https://developmentalphawizz.com/invitation_design/uploads/65c322204ec88.png"
/// type : null
/// cat_id : "69"
/// cat_name : "Wedding Card"

class CategoriesData {
  CategoriesData({
      String? id, 
      String? cName, 
      String? cNameA, 
      String? icon, 
      String? img, 
      dynamic type, 
      String? catId, 
      String? catName,}){
    _id = id;
    _cName = cName;
    _cNameA = cNameA;
    _icon = icon;
    _img = img;
    _type = type;
    _catId = catId;
    _catName = catName;
}

  CategoriesData.fromJson(dynamic json) {
    _id = json['id'];
    _cName = json['c_name'];
    _cNameA = json['c_name_a'];
    _icon = json['icon'];
    _img = json['img'];
    _type = json['type'];
    _catId = json['cat_id'];
    _catName = json['cat_name'];
  }
  String? _id;
  String? _cName;
  String? _cNameA;
  String? _icon;
  String? _img;
  dynamic _type;
  String? _catId;
  String? _catName;
  CategoriesData copyWith({  String? id,
  String? cName,
  String? cNameA,
  String? icon,
  String? img,
  dynamic type,
  String? catId,
  String? catName,
}) => CategoriesData(  id: id ?? _id,
  cName: cName ?? _cName,
  cNameA: cNameA ?? _cNameA,
  icon: icon ?? _icon,
  img: img ?? _img,
  type: type ?? _type,
  catId: catId ?? _catId,
  catName: catName ?? _catName,
);
  String? get id => _id;
  String? get cName => _cName;
  String? get cNameA => _cNameA;
  String? get icon => _icon;
  String? get img => _img;
  dynamic get type => _type;
  String? get catId => _catId;
  String? get catName => _catName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['c_name'] = _cName;
    map['c_name_a'] = _cNameA;
    map['icon'] = _icon;
    map['img'] = _img;
    map['type'] = _type;
    map['cat_id'] = _catId;
    map['cat_name'] = _catName;
    return map;
  }
}