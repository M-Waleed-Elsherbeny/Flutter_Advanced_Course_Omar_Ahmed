class LoginModel {
  String? message;
  UserData? data;
  bool? status;
  int? code;

  LoginModel({this.message, this.data, this.status, this.code});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json['message'],
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
      status: json['status'],
      code: json['code'],
    );
  }
}

class UserData {
  String? token;
  String? username;

  UserData({this.token, this.username});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      token: json['token'],
      username: json['username'],
    );
  }
}
