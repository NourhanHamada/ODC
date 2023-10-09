class SignupModel {
  String? firstName;
  String? lastName;
  String? nationalId;
  String? email;
  String? password;
  String? passwordConfirm;
  String? phone;

  SignupModel(
      {this.firstName,
        this.lastName,
        this.nationalId,
        this.email,
        this.password,
        this.passwordConfirm,
        this.phone});

  SignupModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    nationalId = json['nationalId'];
    email = json['email'];
    password = json['password'];
    passwordConfirm = json['passwordConfirm'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['nationalId'] = nationalId;
    data['email'] = email;
    data['password'] = password;
    data['passwordConfirm'] = passwordConfirm;
    data['phone'] = phone;
    return data;
  }
}