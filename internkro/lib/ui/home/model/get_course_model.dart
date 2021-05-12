class CourseModel {
  String status;
  String msg;
  Data data;

  CourseModel({this.status, this.msg, this.data});

  CourseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Programming> programming;
  //List<Design> design;

  Data({this.programming});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Programming'] != null) {
      programming = new List<Programming>();
      json['Programming'].forEach((v) {
        programming.add(new Programming.fromJson(v));
      });
    }
    /*if (json['Design'] != null) {
      design = new List<Design>();
      json['Design'].forEach((v) {
        design.add(new Design.fromJson(v));
      });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.programming != null) {
      data['Programming'] = this.programming.map((v) => v.toJson()).toList();
    }
    /*if (this.design != null) {
      data['Design'] = this.design.map((v) => v.toJson()).toList();
    }*/
    return data;
  }
}

class Programming {
  String subcategoryUrl;
  String subcategory;
  String icons;

  Programming({this.subcategoryUrl, this.subcategory, this.icons});

  Programming.fromJson(Map<String, dynamic> json) {
    subcategoryUrl = json['subcategory_url'];
    subcategory = json['subcategory'];
    icons = json['icons'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subcategory_url'] = this.subcategoryUrl;
    data['subcategory'] = this.subcategory;
    data['icons'] = this.icons;
    return data;
  }
}