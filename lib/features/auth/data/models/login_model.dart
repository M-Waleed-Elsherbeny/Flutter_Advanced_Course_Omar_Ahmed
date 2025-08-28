class AuthModel {
  String? message;
  UserData? data;
  bool? status;
  int? code;

  AuthModel({this.message, this.data, this.status, this.code});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
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
