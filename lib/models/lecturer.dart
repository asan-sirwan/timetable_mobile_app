import 'course.dart';

class Lecturer {
  int? id;
  String? name;
  String? email;
  String? birthDate;
  String? degree;
  List<Course>? courses;

  Lecturer({
    this.id,
    this.name,
    this.email,
    this.birthDate,
    this.degree,
    this.courses,
  });

  Lecturer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    birthDate = json['birthDate'];
    degree = json['degree'];
    if (json['courses'] != null) {
      courses = <Course>[];
      json['courses'].forEach((v) {
        courses!.add(Course.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['birthDate'] = birthDate;
    data['degree'] = degree;
    if (courses != null) {
      data['courses'] = courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
