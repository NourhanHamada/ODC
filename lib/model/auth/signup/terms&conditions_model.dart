class TermsConditionsModel {
  String? title;
  String? html;
  TermsConditionsModel({this.title,this.html});

  TermsConditionsModel.fromJson(Map<String, dynamic> json) {
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
