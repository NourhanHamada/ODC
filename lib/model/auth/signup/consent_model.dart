class ConsentModel {
  String? title;
  String? html;
  ConsentModel({this.title, this.html});

  ConsentModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    html = json['html'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['title'] = title;
    data['html'] = html;

    return data;
  }
}
