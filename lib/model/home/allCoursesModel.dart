class AllCoursesModel {
   int? id;
   String? name;
   String? imageUrl;
   String? description;
   String? content;
   int? hours;
   String? level;
   String? prerequisites;
   String? whatToLearn;
   DateTime? startDate;
   DateTime? endDate;
   String? courseStatus;
   String? place;
   int? sessions;
   List<Schedule>? schedule;

  AllCoursesModel(
      {  required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.content,
    required this.hours,
    required this.level,
    required this.prerequisites,
    required this.whatToLearn,
    required this.startDate,
    required this.endDate,
    required this.courseStatus,
    required this.place,
    required this.sessions,
    required this.schedule});

  AllCoursesModel.fromJson(Map<String, dynamic> json) {
    id= json['id'];
      name= json['name'];
      imageUrl= json['imageUrl'];
      description= json['description'];
      content= json['content'];
      hours= json['hours'];
      level= json['level'];
      prerequisites= json['Prerequisites'];
      whatToLearn= json['whatToLearn'];
      startDate= DateTime.parse(json['startDate']);
      endDate= DateTime.parse(json['endDate']);
      courseStatus= json['courseStatus'];
      place= json['place'];
      sessions= json['sessions'];
       schedule = json['schedule'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['description'] = description;
    data['content'] = content;
    data['hours'] = hours;
    data['level'] = level;
    data['prerequisites'] = prerequisites;
    data['whatToLearn'] = whatToLearn;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['courseStatus'] = courseStatus;
    data['place'] = place;
    data['sessions'] = sessions;

    return data;
  }
}



class Schedule {
   int? id;
   String? day;
   String? time;
   int? courseId;

  Schedule({
    required this.id,
    required this.day,
    required this.time,
    required this.courseId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['day'] = day;
    data['time'] = time;
    data['courseId'] = courseId;
   

    return data;
  }
}






