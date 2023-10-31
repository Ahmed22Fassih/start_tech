class SignUpModel {
  String? name;
  String? email;
  String? mobile;
  String? countryCode;
  String? password;
  String? confirmPassword;
  SignUpModel(
      {this.name,
      this.email,
      this.mobile,
      this.countryCode,
      this.password,
      this.confirmPassword});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    mobile = json['country_code'];
    countryCode = json['mobile'];
    password = json['password'];
    confirmPassword = json['password_confirm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = mobile;
    data['country_code'] = countryCode;
    data['password'] = password;
    data['password_confirm'] = confirmPassword;
    return data;
  }
}
