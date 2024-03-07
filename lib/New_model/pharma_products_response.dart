/// response_code : "1"
/// msg : "Template Services"
/// data : [{"category_id":"69","sub_category_id":"4","id":"42","title":"Ghnvbghfgh","description":"Ghgfhgfh","template":"uploads/html/65c4d21b68ac23a688d6278b600b6","html":null,"preview":"https://developmentalphawizz.com/invitation_design/uploads/65c4d21b69cd7.jpg","price":"0.00","image":"https://developmentalphawizz.com/invitation_design/uploads/uploads/html/65c4d21b68ac23a688d6278b600b6"}]

class PharmaProductsResponse {
  PharmaProductsResponse({
      String? responseCode, 
      String? msg, 
      List<Data>? data,}){
    _responseCode = responseCode;
    _msg = msg;
    _data = data;
}

  PharmaProductsResponse.fromJson(dynamic json) {
    _responseCode = json['response_code'];
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _responseCode;
  String? _msg;
  List<Data>? _data;
PharmaProductsResponse copyWith({  String? responseCode,
  String? msg,
  List<Data>? data,
}) => PharmaProductsResponse(  responseCode: responseCode ?? _responseCode,
  msg: msg ?? _msg,
  data: data ?? _data,
);
  String? get responseCode => _responseCode;
  String? get msg => _msg;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response_code'] = _responseCode;
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// category_id : "69"
/// sub_category_id : "4"
/// id : "42"
/// title : "Ghnvbghfgh"
/// description : "Ghgfhgfh"
/// template : "uploads/html/65c4d21b68ac23a688d6278b600b6"
/// html : null
/// preview : "https://developmentalphawizz.com/invitation_design/uploads/65c4d21b69cd7.jpg"
/// price : "0.00"
/// image : "https://developmentalphawizz.com/invitation_design/uploads/uploads/html/65c4d21b68ac23a688d6278b600b6"

class Data {
  Data({
      String? categoryId, 
      String? subCategoryId, 
      String? id, 
      String? title, 
      String? description, 
      String? template, 
      dynamic html, 
      String? preview, 
      String? price, 
      String? image,}){
    _categoryId = categoryId;
    _subCategoryId = subCategoryId;
    _id = id;
    _title = title;
    _description = description;
    _template = template;
    _html = html;
    _preview = preview;
    _price = price;
    _image = image;
}

  Data.fromJson(dynamic json) {
    _categoryId = json['category_id'];
    _subCategoryId = json['sub_category_id'];
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _template = json['template'];
    _html = json['html'];
    _preview = json['preview'];
    _price = json['price'];
    _image = json['image'];
  }
  String? _categoryId;
  String? _subCategoryId;
  String? _id;
  String? _title;
  String? _description;
  String? _template;
  dynamic _html;
  String? _preview;
  String? _price;
  String? _image;
Data copyWith({  String? categoryId,
  String? subCategoryId,
  String? id,
  String? title,
  String? description,
  String? template,
  dynamic html,
  String? preview,
  String? price,
  String? image,
}) => Data(  categoryId: categoryId ?? _categoryId,
  subCategoryId: subCategoryId ?? _subCategoryId,
  id: id ?? _id,
  title: title ?? _title,
  description: description ?? _description,
  template: template ?? _template,
  html: html ?? _html,
  preview: preview ?? _preview,
  price: price ?? _price,
  image: image ?? _image,
);
  String? get categoryId => _categoryId;
  String? get subCategoryId => _subCategoryId;
  String? get id => _id;
  String? get title => _title;
  String? get description => _description;
  String? get template => _template;
  dynamic get html => _html;
  String? get preview => _preview;
  String? get price => _price;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = _categoryId;
    map['sub_category_id'] = _subCategoryId;
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['template'] = _template;
    map['html'] = _html;
    map['preview'] = _preview;
    map['price'] = _price;
    map['image'] = _image;
    return map;
  }

}