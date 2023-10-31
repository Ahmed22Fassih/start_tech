import 'dart:developer';

class LoginResponseModel {
  bool? success;
  String? message;
  UserData? userData;

  LoginResponseModel({success, message, userData});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    print("jsonjson ${json}");
    success = json['success'];
    message = json['message'];
    userData = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (userData != null) {
      data['data'] = userData!.toJson();
    }
    return data;
  }
}

class UserData {
  int? id;
  String? name;
  String? countryCode;
  int? phone;
  String? email;
  String? token;
  String? tokenExpiry;

  UserData({id, name, countryCode, phone, email, token, tokenExpiry});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryCode = json['country_code'];
    phone = json['phone'];
    email = json['email'];
    token = json['token'];
    tokenExpiry = json['token_expiry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['country_code'] = countryCode;
    data['phone'] = phone;
    data['email'] = email;
    data['token'] = token;
    data['token_expiry'] = tokenExpiry;
    return data;
  }
}
