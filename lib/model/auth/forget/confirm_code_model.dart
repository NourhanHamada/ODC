class ConfirmCodeModel {
  String? code;

  ConfirmCodeModel({
    this.code,
  });

  ConfirmCodeModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['code'] = code;

    return data;
  }
}
