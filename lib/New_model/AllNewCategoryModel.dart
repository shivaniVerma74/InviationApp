class AllNewCategoryModel {
  bool? status;
  String? message;
  List<Data>? data;

  AllNewCategoryModel({this.status, this.message, this.data});

  AllNewCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? id;
  String? cName;
  String? cNameA;
  String? icon;
  Null? subTitle;
  Null? description;
  String? img;
  String? otherImg;
  String? type;
  Null? pId;
  String? serviceType;
  String? catType;
  int? subCategories;
  List<Templates>? templates;

  Data(
      {this.id,
        this.cName,
        this.cNameA,
        this.icon,
        this.subTitle,
        this.description,
        this.img,
        this.otherImg,
        this.type,
        this.pId,
        this.serviceType,
        this.catType,
        this.subCategories,
        this.templates});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cName = json['c_name'];
    cNameA = json['c_name_a'];
    icon = json['icon'];
    subTitle = json['sub_title'];
    description = json['description'];
    img = json['img'];
    otherImg = json['other_img'];
    type = json['type'];
    pId = json['p_id'];
    serviceType = json['service_type'];
    catType = json['cat_type'];
    subCategories = json['sub_categories'];
    if (json['templates'] != null) {
      templates = <Templates>[];
      json['templates'].forEach((v) {
        templates!.add(new Templates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['c_name'] = this.cName;
    data['c_name_a'] = this.cNameA;
    data['icon'] = this.icon;
    data['sub_title'] = this.subTitle;
    data['description'] = this.description;
    data['img'] = this.img;
    data['other_img'] = this.otherImg;
    data['type'] = this.type;
    data['p_id'] = this.pId;
    data['service_type'] = this.serviceType;
    data['cat_type'] = this.catType;
    data['sub_categories'] = this.subCategories;
    if (this.templates != null) {
      data['templates'] = this.templates!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Templates {
  String? categoryId;
  String? subCategoryId;
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
        this.subCategoryId,
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
    subCategoryId = json['sub_category_id'];
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
    data['sub_category_id'] = this.subCategoryId;
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
