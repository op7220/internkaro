class LoginModel {
  String status;
  String msg;
  List<Data> data;

  LoginModel({this.status, this.msg, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
  String studentId;
  String firstName;
  String lastName;
  String email;
  String mobile;
  String password;

  Data(
      {this.studentId,
        this.firstName,
        this.lastName,
        this.email,
        this.mobile,
        this.password});

  Data.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    firstName = json['first_name'];
    lastName = json['Last_name'];
    email = json['email'];
    mobile = json['mobile'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['first_name'] = this.firstName;
    data['Last_name'] = this.lastName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    return data;
  }
}


