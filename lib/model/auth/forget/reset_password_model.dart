class ResetPasswordModel {
  String? newPassword;
  String? confirmNewPassword;
  String? token;

  ResetPasswordModel({
    this.newPassword,this.confirmNewPassword,this.token
  });

  ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    newPassword = json['newPassword'];
     confirmNewPassword = json['confirmNewPassword'];
      token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['newPassword'] = newPassword;
    data['confirmNewPassword'] = confirmNewPassword;
    data['token'] = token;

    return data;
  }
}
