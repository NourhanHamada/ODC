class OnBoardFailModel {
  final String image;
  final String title;
  final String subTitle;

  OnBoardFailModel({
    this.image = '',
    this.title = '',
    this.subTitle = '',
  });

  factory OnBoardFailModel.fromMap(Map<String, dynamic> map){
    return OnBoardFailModel(
      image: map['image'],
      title: map['title'],
      subTitle: map['subTitle'],
    );
  }
}
