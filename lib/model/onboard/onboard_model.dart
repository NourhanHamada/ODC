// class OnboardModel {
//   int? id;
//   String? imageUrl;
//   String? title;
//   String? description;
//
//   OnboardModel({this.id, this.imageUrl, this.title, this.description});
//
//   OnboardModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     imageUrl = json['imageUrl'];
//     title = json['title'];
//     description = json['description'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['imageUrl'] = imageUrl;
//     data['title'] = title;
//     data['description'] = description;
//     return data;
//   }
// }



class OnboardModel {
  int? statusCode;
  String? message;
  List<Data>? data;

  OnboardModel({this.statusCode, this.message, this.data});

  OnboardModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? imageUrl;
  String? title;
  String? description;

  Data({this.id, this.imageUrl, this.title, this.description});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}