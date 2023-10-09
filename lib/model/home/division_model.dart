class DivisionModel {
  int? id;
  String? name;
  String? imageUrl;
  String? description;
  String? createdAt;
  String? updatedAt;

  DivisionModel(
      {this.id,
      this.name,
      this.imageUrl,
      this.description,
      this.createdAt,
      this.updatedAt});

  DivisionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['description'] = description;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;

    return data;
  }
}
