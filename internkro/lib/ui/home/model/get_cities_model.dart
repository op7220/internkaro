class CitiesModel {
  String status;
  String msg;
  List<Data> data;

  CitiesModel({this.status, this.msg, this.data});

  CitiesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String locationId;
  String locationUrl;
  String locationName;
  String icons;

  Data({this.locationId, this.locationUrl, this.locationName, this.icons});

  Data.fromJson(Map<String, dynamic> json) {
    locationId = json['location_id'];
    locationUrl = json['location_url'];
    locationName = json['location_name'];
    icons = json['icons'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location_id'] = this.locationId;
    data['location_url'] = this.locationUrl;
    data['location_name'] = this.locationName;
    data['icons'] = this.icons;
    return data;
  }
}