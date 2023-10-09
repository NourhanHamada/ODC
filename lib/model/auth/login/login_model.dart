class LoginModel {
  String? email;
  String? password;
  String? id;
  String? first_name;
  String? last_name;

  String? phone;
  String? nationalId;
  String? createdAt;
  String? updatedAt;
  String? birthdate;
  String? class_standing;
  String? country;
  String? faculty;
  String? gender;
  String? github_behance;
  String? governate;
  String? graduation_status;
  String? graduation_year;
  String? interested_field;
  String? linkedin;
  String? major;
  String? university;
  int? courseCount;
  List? userCourses;
  String? access_token;
  String? refresh_token;

  LoginModel(
      {this.email,
      this.password,
      this.first_name,
      this.last_name,
      this.access_token,
      this.refresh_token,
      this.id,
      this.birthdate,
      this.class_standing,
      this.country,
      this.courseCount,
      this.createdAt,
      this.faculty,
      this.gender,
      this.github_behance,
      this.governate,
      this.graduation_status,
      this.graduation_year,
      this.interested_field,
      this.linkedin,
      this.major,
      this.nationalId,
      this.phone,
      this.university,
      this.updatedAt,
      this.userCourses});

  LoginModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    id = json['id'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    phone = json['phone'];
    nationalId = json['nationalId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    birthdate = json['birthdate'];
    class_standing = json['class_standing'];
    country = json['country'];
    faculty = json['faculty'];
    gender = json['gender'];
    github_behance = json['github_behance'];
    governate = json['governate'];
    graduation_status = json['graduation_status'];
    graduation_year = json['graduation_year'];
    interested_field = json['interested_field'];
    linkedin = json['linkedin'];
    major = json['major'];
    university = json['university'];
    courseCount = json['courseCount'];
    userCourses = json['userCourses'];
    access_token = json['access_token'];
     refresh_token = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['email'] = email;
    data['password'] = password;
    data['id'] = id;
    data['first_name'] = first_name;
    data['last_name'] = last_name;
    data['phone'] = phone;
    data['nationalId'] = nationalId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['birthdate'] = birthdate;
    data['class_standing'] = class_standing;
    data['country'] = country;
    data['faculty'] = faculty;
    data['gender'] = gender;
    data['github_behance'] = github_behance;
    data['governate'] = governate;
    data['graduation_status'] = graduation_status;
    data['graduation_year'] = graduation_year;
    data['interested_field'] = interested_field;
    data['linkedin'] = linkedin;
    data['major'] = major;
    data['university'] = university;
    data['courseCount'] = courseCount;
    data['userCourses'] = userCourses;
    data['access_token'] = access_token;
    data['refresh_token'] = refresh_token;

    return data;
  }
}



// class LoginModel {
//   int? statusCode;
//   String? message;
//   Data? data;
//
//   LoginModel({this.statusCode, this.message, this.data});
//
//   LoginModel.fromJson(Map<String, dynamic> json) {
//     statusCode = json['statusCode'];
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['statusCode'] = this.statusCode;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   String? id;
//   String? firstName;
//   String? lastName;
//   String? email;
//   String? phone;
//   String? nationalId;
//   String? createdAt;
//   String? updatedAt;
//   String? birthdate;
//   String? classStanding;
//   String? country;
//   String? faculty;
//   String? gender;
//   String? githubBehance;
//   String? governate;
//   String? graduationStatus;
//   String? graduationYear;
//   String? interestedField;
//   String? linkedin;
//   String? major;
//   String? university;
//   int? courseCount;
//   List<Null>? userCourses;
//   String? accessToken;
//   String? refreshToken;
//
//   Data(
//       {this.id,
//         this.firstName,
//         this.lastName,
//         this.email,
//         this.phone,
//         this.nationalId,
//         this.createdAt,
//         this.updatedAt,
//         this.birthdate,
//         this.classStanding,
//         this.country,
//         this.faculty,
//         this.gender,
//         this.githubBehance,
//         this.governate,
//         this.graduationStatus,
//         this.graduationYear,
//         this.interestedField,
//         this.linkedin,
//         this.major,
//         this.university,
//         this.courseCount,
//         this.userCourses,
//         this.accessToken,
//         this.refreshToken});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     email = json['email'];
//     phone = json['phone'];
//     nationalId = json['nationalId'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     birthdate = json['birthdate'];
//     classStanding = json['class_standing'];
//     country = json['country'];
//     faculty = json['faculty'];
//     gender = json['gender'];
//     githubBehance = json['github_behance'];
//     governate = json['governate'];
//     graduationStatus = json['graduation_status'];
//     graduationYear = json['graduation_year'];
//     interestedField = json['interested_field'];
//     linkedin = json['linkedin'];
//     major = json['major'];
//     university = json['university'];
//     courseCount = json['courseCount'];
//     // if (json['userCourses'] != null) {
//     //   userCourses = <Null>[];
//     //   json['userCourses'].forEach((v) {
//     //     userCourses!.add(new Null.fromJson(v));
//     //   });
//     // }
//     accessToken = json['access_token'];
//     refreshToken = json['refresh_token'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     data['email'] = this.email;
//     data['phone'] = this.phone;
//     data['nationalId'] = this.nationalId;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['birthdate'] = this.birthdate;
//     data['class_standing'] = this.classStanding;
//     data['country'] = this.country;
//     data['faculty'] = this.faculty;
//     data['gender'] = this.gender;
//     data['github_behance'] = this.githubBehance;
//     data['governate'] = this.governate;
//     data['graduation_status'] = this.graduationStatus;
//     data['graduation_year'] = this.graduationYear;
//     data['interested_field'] = this.interestedField;
//     data['linkedin'] = this.linkedin;
//     data['major'] = this.major;
//     data['university'] = this.university;
//     data['courseCount'] = this.courseCount;
//     // if (this.userCourses != null) {
//     //   data['userCourses'] = this.userCourses!.map((v) => v.toJson()).toList();
//     // }
//     data['access_token'] = this.accessToken;
//     data['refresh_token'] = this.refreshToken;
//     return data;
//   }
// }