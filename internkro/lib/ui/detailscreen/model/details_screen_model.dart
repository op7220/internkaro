class DetailsScreenModel {
  String status;
  String msg;
  List<Data> data;

  DetailsScreenModel({this.status, this.msg, this.data});

  DetailsScreenModel.fromJson(Map<String, dynamic> json) {
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
  String employerId;
  String inernId;
  String orgUrl;
  String orgLogo;
  String orgName;
  String city;
  String interType;
  String startDate;
  String endDate;
  String noOfOpening;
  String stipend;
  String orgDescsription;
  String responsibilities;
  String comanyDetailsUrl;

  Data(
      {this.employerId,
        this.inernId,
        this.orgUrl,
        this.orgLogo,
        this.orgName,
        this.city,
        this.interType,
        this.startDate,
        this.endDate,
        this.noOfOpening,
        this.stipend,
        this.orgDescsription,
        this.responsibilities,
        this.comanyDetailsUrl});

  Data.fromJson(Map<String, dynamic> json) {
    employerId = json['employer_id'];
    inernId = json['inern_id'];
    orgUrl = json['org_url'];
    orgLogo = json['org_logo'];
    orgName = json['org_name'];
    city = json['city'];
    interType = json['inter_type'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    noOfOpening = json['no_of_opening'];
    stipend = json['stipend'];
    orgDescsription = json['org_descsription'];
    responsibilities = json['responsibilities'];
    comanyDetailsUrl = json['comany_details_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employer_id'] = this.employerId;
    data['inern_id'] = this.inernId;
    data['org_url'] = this.orgUrl;
    data['org_logo'] = this.orgLogo;
    data['org_name'] = this.orgName;
    data['city'] = this.city;
    data['inter_type'] = this.interType;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['no_of_opening'] = this.noOfOpening;
    data['stipend'] = this.stipend;
    data['org_descsription'] = this.orgDescsription;
    data['responsibilities'] = this.responsibilities;
    data['comany_details_url'] = this.comanyDetailsUrl;
    return data;
  }
}